import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training/compands.dart';
import 'package:training/cubit/cubit_newlayout.dart';
import 'package:training/cubit/states_newlayout.dart';

class SearshScreen extends StatelessWidget {
  const SearshScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewCubit,NewStates>(
      listener: (context,state){},
      builder: (context,state){
        var list = NewCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  controller: TextEditingController(),
                  keyboardType: TextInputType.text,
                  validator: (String? value)
                  {
                    if (value!.isEmpty)
                    {
                      return"search must not be empty";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Searsh"),
                      prefixIcon:Icon( Icons.search)
                  ),
                  onChanged: (value)
                  {
                    NewCubit.get(context).getSearch(value);
                  },
                ),
              ),
              Expanded(child: articleBuilder(List, context))
            ],
          ),
        );
      },
    );
  }
}
