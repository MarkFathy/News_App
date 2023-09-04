import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news2/Pages/search.dart';

import '../bloc/cubit.dart';
import '../bloc/states.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override

  Widget build(BuildContext context) {
    return  BlocConsumer<NewsCubit,NewsStates>(
        listener: (context,state){},
        builder:(context,state)
        {
          var cubit =NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                  'News App',
              ),
              actions: [
                IconButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchScreen()));
                }, icon: const Icon(Icons.search,color: Colors.grey,)),
                IconButton(
                    onPressed: (){}, icon: Icon(Icons.brightness_4))
              ],
            ),
            body:cubit.Screens[cubit.currentindex] ,
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentindex,
              items:cubit.bottomItems,
               onTap: (index){
                cubit.changeBottomNavBar(index);
               },

            ),


          );


        } ,

      );

  }
}
