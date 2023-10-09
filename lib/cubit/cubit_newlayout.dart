import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training/buisness.dart';
import 'package:training/cubit/states_newlayout.dart';
import 'package:training/science.dart';
import 'package:training/settings_screen.dart';
import 'package:training/sports.dart';
import 'package:training/dio_helper.dart';

class NewCubit extends Cubit<NewStates>
{
  NewCubit() : super(InitialState());

  static NewCubit get(context) => BlocProvider.of(context);
  int currentIndx = 0;
  List<BottomNavigationBarItem> bottomItems =
      [
        const BottomNavigationBarItem(
            icon: Icon(
              Icons.business,
            ),
          label: "Business"
        ),
        const BottomNavigationBarItem(
            icon: Icon(
              Icons.sports,
            ),
            label: "Sports"
        ),
        const BottomNavigationBarItem(
            icon: Icon(
              Icons.science,
            ),
            label: "science"
        ),
        const BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
            ),
            label: "settings"
        )

      ];
  List <Widget> screens =
      [
        const Buisness_screen(),
        const sports_screen(),
        const sciense_screen(),
        const settings_screen()
      ];
  void changebottomnavbar(int index)
  {
    currentIndx = index;
    emit(NewBottomNavState());
  }
  List<dynamic> buisness = [];
  void getBuisness()
  {
    emit(NewGetBuisnessLoadingState());
    dioHelper.getdata(
      url:'v2/top-headlines' ,
      quary: {
        'country':'us',
        'category':'business',
        'apiKey':'4307dc5f5f034807bf2e721fcefeb843',
      },
    ).then((value) {
      buisness = value.data['articles'];
      print(buisness[0]['title']);
      emit(NewsGetBuisnessScssedState());
    }).catchError((error){
      print(error.toString());
      emit(NewsGetBuisnessErorrState(error.toString()));
    });
  }

  List<dynamic> sports = [];
  void getSports() {
    emit(NewGetSportsLoadingState());
      dioHelper.getdata(
        url: 'v2/top-headlines',
        quary: {
          'sources': 'techcrunch',
          'apiKey': '4307dc5f5f034807bf2e721fcefeb843',
        },
      ).then((value) {
        sports = value.data['articles'];
        print(sports[0]['title']);
        emit(NewsGetSportsScssedState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetSportsErorrState(error.toString()));
      });
  }

  List<dynamic> science = [];
  void getScience()
  {
    emit(NewGetScienceLoadingState());

      dioHelper.getdata(
        url: 'v2/everything',
        quary: {
          'q': 'apple',
          'from': '2023-07-04&to=2023-07-04',
          'sortBy': 'popularity',
          'apiKey': '4307dc5f5f034807bf2e721fcefeb843',
        },
      ).then((value) {
        science = value.data['articles'];
        print(science[0]['title']);
        emit(NewsGetScienceScssedState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetScienceErorrState(error.toString()));
      });

  }

  List<dynamic> search = [];
  void getSearch(String value)
  {
    emit(NewGetSearchLoadingState());

    dioHelper.getdata(
      url: 'v2/everything',
      quary: {
        'q': '$value',
        'apiKey': '65f7f556ec76449fa7dc7c0069f040ca',
      },
    ).then((value) {
      search = value.data['articles'];
      print(search[0]['title']);
      emit(NewsGetSearchScssedState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetSearchErorrState(error.toString()));
    });

  }
}