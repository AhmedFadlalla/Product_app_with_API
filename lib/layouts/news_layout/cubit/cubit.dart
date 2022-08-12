import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce/layouts/news_layout/cubit/states.dart';
import 'package:e_commerce/shared/network/remote/dio.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../modulus/news_app/business/business_screen.dart';
import '../../../modulus/news_app/science/science_screens.dart';
import '../../../modulus/news_app/sports/sports_screens.dart';

class newsCubit extends Cubit<newsStates> {
  newsCubit() : super(newsInitialState());

  static newsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> newsScreens = [
    const BusinessScreen(),
    const SportsScreen(),
    const ScienceScreen(),
  ];
  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.business), label: "Business"),
    const BottomNavigationBarItem(icon: Icon(Icons.sports), label: "Sports"),
    const BottomNavigationBarItem(icon: Icon(Icons.science), label: "Science"),
  ];

  void changeIndex(index) {
    currentIndex = index;
    // if(index==1)
    //   getSports();
    // if(index==2)
    //   getScience();

    emit(newschangeIndex());
  }

  List<dynamic> business = [];

  void getBusiness() {
    emit(newsGetBusinessLodingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'business',
      'apiKey': '6548987cacc64a19a4e82084fce1b2fe'
    }).then((value) {
      business = value.data['articles'];
      if (kDebugMode) {
        print(business);
      }
      emit(newsGetBusinessSuccessState());
    }).catchError((error) {
      if (kDebugMode) {
        print('error');
        print(error.toString());
      }
      emit(newsGetBusinessErrorState(error.toString()));
    });
  }

  List<dynamic> sports = [];

  void getSports() {
    emit(newsGetSportsLodingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'sports',
      'apiKey': '6548987cacc64a19a4e82084fce1b2fe'
    }).then((value) {
      sports=value.data['articles'];
      emit(newsGetSportsSuccessState());
    }).catchError((error) {
      if (kDebugMode) {
        print('error');
        print(error.toString());
      }
      emit(newsGetSportsErrorState(error.toString()));
    });
  }

  List<dynamic> science = [];

  void getScience() {
    emit(newsGetScienceLodingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'science',
      'apiKey': '6548987cacc64a19a4e82084fce1b2fe'
    }).then((value) {
      science=value.data['articles'];
      emit(newsGetScienceSuccessState());
    }).catchError((error) {
      if (kDebugMode) {
        print('error');
        print(error.toString());
      }
      emit(newsGetScienceErrorState(error.toString()));
    });
  }



  List<dynamic> search=[];

  void getSearch(String value){

    emit(newsGetSearchLodingState());
    search=[];
    DioHelper.getData(url: 'v2/everything', query: {
      'q':value,
      'apiKey': '6548987cacc64a19a4e82084fce1b2fe'
    }).then((value) {
      search = value.data['articles'];
      if (kDebugMode) {
        print(search[0]['title']);
      }
      emit(newsGetSearchSuccessState());
    }).catchError((error){
      if (kDebugMode) {
        print(error.toString());
      }
      emit(newsGetSearchErrorState(error.toString()));
    });

  }
}
