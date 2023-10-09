import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training/compands.dart';
import 'package:training/cubit.dart';
import 'package:training/cubit/cubit_newlayout.dart';
import 'package:training/cubit/states_newlayout.dart';
import 'package:training/dio_helper.dart';
import 'package:training/searsh.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return BlocConsumer<NewCubit, NewStates>(
        listener: (context, state){},
        builder: (context, state)
        {
          var cubit = NewCubit .get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text("NewsApp"),
              actions: [
                IconButton(
                    onPressed: ()
                    {
                      navigateTo(context, SearshScreen());
                    },
                    icon: Icon(Icons.search)
                ),
                IconButton(
                    onPressed: (){
                      counterCubit.get(context).changeAppMode();
                    },
                    icon: Icon(Icons.brightness_4_outlined)
                )
              ],
            ),
            body: cubit.screens[cubit.currentIndx],
            bottomNavigationBar: BottomNavigationBar(
              items: cubit.bottomItems,
              currentIndex: cubit.currentIndx,
              onTap: (index)
              {
                cubit.changebottomnavbar(index);
              },

            ),
          );
        },
    );
  }
}
