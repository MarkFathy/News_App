import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news2/APIlink/dio.dart';
import 'package:news2/Pages/business.dart';
import 'package:news2/Pages/science.dart';
import 'package:news2/Pages/settings.dart';
import 'package:news2/Pages/sports.dart';
import 'package:news2/bloc/states.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsIntialState());
  static NewsCubit get(context) => BlocProvider.of(context);
  int currentindex = 0;

  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.business), label: 'Business'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.sports_baseball), label: 'Sports'),
    const BottomNavigationBarItem(icon: Icon(Icons.science), label: 'Science'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.settings), label: 'Settings'),
  ];
  List<Widget> Screens = [
    const BusinessScren(),
    const SportsScreen(),
    const ScienceScreen(),
    const SettingsScreen(),
  ];

  void changeBottomNavBar(int index) {
    currentindex = index;
    if (index == 0) {
      getBusiness();
    } else if (index == 1) {
      getSports();
    } else if (index == 2) {
      getScience();
    }
    emit(NewsBottomNavState());
  }

  List<dynamic> business = [];
  List<dynamic> Sports = [];
  List<dynamic> Science = [];

  void getBusiness() {
    emit(NewsLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'us',
        'category': 'business',
        'apiKey': '6507c77ae3a04b05a4d5c61d504740b0',
      },
    )?.then((value) {
      //print (value.data['articles'][0]['title']);
      print("res: ${value.data}");
      business = value.data['articles'];
      print(business[0]['title']);
      emit(NewsGetBusinessSuccessState());
    }).catchError((error) {

      print(error.toString());
      emit(NewsGetBusinessErrorState(error.toString()));
    });
  }

  void getSports() {
    emit(NewsLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'us',
        'category': 'sports',
        'apiKey': '6507c77ae3a04b05a4d5c61d504740b0',
      },
    )?.then((value) {
      //print (value.data['articles'][0]['title']);
      Sports = value.data['articles'];
      print(business[0]['title']);
      emit(NewsGetSportsSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetSportsErrorState(error.toString()));
    });
  }

  void getScience() {
    emit(NewsLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'us',
        'category': 'science',
        'apiKey': '6507c77ae3a04b05a4d5c61d504740b0',
      },
    )?.then((value) {
      //print (value.data['articles'][0]['title']);
      Science = value.data['articles'];
      print(Science[0]['title']);
      emit(NewsGetScienceSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetScienceErrorState(error.toString()));
    });
  }

  List<dynamic> search = [];
  void getSearch(String value) {
    emit(NewsSearchLoadingState());
    DioHelper.getData(

      url: 'v2/everything',
      query: {
        'q': '$value',
        'apiKey': '6507c77ae3a04b05a4d5c61d504740b0',
      },
    )?.then((value) {
      //print (value.data['articles'][0]['title']);
      List<dynamic> articles = value.data['articles'];
      search = articles.map((article) => article['title'].toString()).toList();

      print(search[0]);
      emit(NewsGetSearchSuccessState());

    }).catchError((error) {
      print(error.toString());
      emit(NewsGetSearchErrorState(error.toString()));
    });
  }



}
