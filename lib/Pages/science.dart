import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Components/components.dart';
import '../bloc/cubit.dart';
import '../bloc/states.dart';

class ScienceScreen extends StatelessWidget {
  const ScienceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var list = NewsCubit
              .get(context)
              .Science;

          return ConditionalBuilder(
            condition: list.length>0,
            builder: (context) =>
                ListView.separated(
                  physics: BouncingScrollPhysics(),
                  itemCount: list.length,
                  itemBuilder: (context, index) => PageItem(list[index],context),
                  separatorBuilder: (context, index) =>
                      Divider(height: 3, color: Colors.white),
                ),
            fallback: (context) =>
                Center(
                  child: CircularProgressIndicator(),
                ),
          );
        });
  }
}
