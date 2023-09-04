import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news2/APIlink/dio.dart';

import 'Pages/home.dart';
import 'bloc/cubit.dart';


void main() {
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>NewsCubit()..getBusiness()..getScience()..getSports(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(

            textTheme: TextTheme(
              bodyText1: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
            iconTheme: IconThemeData(
              color: Colors.black,
              size: 25,
            ),
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.white,
                statusBarIconBrightness: Brightness.dark
            ),
            elevation: 0,
            backgroundColor: Colors.white,
            titleTextStyle: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),

          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.green,

          )
        ),
        darkTheme: ThemeData(
          textTheme: TextTheme(
            bodyText1: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
         scaffoldBackgroundColor:Color(0xFF192734),
            appBarTheme: const AppBarTheme(
              iconTheme: IconThemeData(
                color: Colors.white,
                size: 25,
              ),
              systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Color(0xFF192734),
                  statusBarIconBrightness: Brightness.light
              ),
              elevation: 0,
              backgroundColor: Color(0xFF192734),
              titleTextStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),

            ),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              backgroundColor: Color(0xFF192734),
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.white,
              unselectedItemColor: Color(0xFF8899ac),

            ),

        ),
        themeMode: ThemeMode.dark,
        home:HomeScreen(),
      ),
    );
  }
}
