import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training/compands.dart';
import 'package:training/cubit/cubit_newlayout.dart';
import 'package:training/cubit/states_newlayout.dart';

class sciense_screen extends StatelessWidget {
  const sciense_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewCubit,NewStates>(
      listener: (context, state){},
      builder: (context,state){
        var List = NewCubit.get(context).science;
        // return ConditionalBuilder(
        //   condition: state is! NewGetBuisnessLoadingState ,
        //   builder: (context) =>
        return  articleBuilder(List,context);
      },
    );
  }
}