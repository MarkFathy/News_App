
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news2/Components/components.dart';
import 'package:news2/bloc/cubit.dart';
import 'package:news2/bloc/states.dart';

class BusinessScren extends StatelessWidget {
  const BusinessScren({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var list =NewsCubit.get(context).business;

          return ConditionalBuilder(
            condition: list.isNotEmpty,
            builder:(context)=>
             ListView.separated(
              physics:const BouncingScrollPhysics(),
              itemCount: list.length,
              itemBuilder:  (context, index) =>PageItem(list[index],context) ,
               separatorBuilder: (context, index) => const Divider( height: 3, color: Colors.white),
             ),
            fallback: (context)=>const Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}
