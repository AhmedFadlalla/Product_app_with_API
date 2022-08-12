import 'package:bloc/bloc.dart';
import 'package:e_commerce/models/current_weather_data.dart';
import 'package:e_commerce/modulus/home_screen/cubit/state.dart';
import 'package:e_commerce/service/weather_service.dart';
import 'package:e_commerce/shared/component/constants.dart';
import 'package:e_commerce/shared/network/remote/api_repo.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/five_days_data.dart';

class WeatherCubit extends Cubit<WeatherState>{
  WeatherCubit(this.city):super(WeatherInitialState());

  String city;
  static WeatherCubit get(context)=>BlocProvider.of(context);




  CurrentWeatherData? currentWeatherData;

  void getCurrentWeatherData(){
    emit(GetWeatherDataLoadingState());
    ApiRepo.getData(url: "weather", query: {
      'q':'cairo',
      'appid':apiKey
    }).then((value) {
      currentWeatherData=CurrentWeatherData.fromJson(value.data);
      emit(GetWeatherDataSuccessState());
    }).catchError((error){
      if (kDebugMode) {
        print(error.toString());
      }
      emit(GetWeatherDataErrorState(error.toString()));
    });

  }



}