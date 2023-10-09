import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training/cubit.dart';
import 'package:training/states.dart';

class CounterScreen extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:(BuildContext context) => counterCubit() ,
      child: BlocConsumer <counterCubit,counterState> (
        listener: (context, state){},
        builder: (context, state)
        {
          return Scaffold(
            appBar: AppBar(
              title: Text("counter"),
            ),
            body: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {
                        counterCubit.get(context).miuns();
                      },
                      child: Text('mins')
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "${counterCubit.get(context).counter}",
                      style: TextStyle(
                          fontSize: 50.0,
                          fontWeight: FontWeight.w900
                      ),
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        counterCubit.get(context).pluss();
                      },
                      child: Text('plus')
                  ),

                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
