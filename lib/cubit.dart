import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training/cache_helper.dart';
import 'package:training/states.dart';

class counterCubit extends Cubit<counterState>
{
  counterCubit (): super(counterInitialState());

  static counterCubit get (context) => BlocProvider.of(context);
  int counter = 1;

  void miuns ()
  {
    counter--;
    emit(mins());
  }

  void pluss ()
  {
    counter++;
    emit(plus());
  }

  bool isDark = false;
  void changeAppMode({bool? fromShared})
  {
    if(fromShared != null) {
      isDark = fromShared;
      emit(AppChangeModeState());
    }
    else {
      isDark = !isDark;
      cacheHelper.putData(key: 'isDark', value: isDark).then((value) {
        emit(AppChangeModeState());
      });
    }
  }

}