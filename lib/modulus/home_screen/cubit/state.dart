import 'package:e_commerce/models/whether.dart';

abstract class WeatherState{}

class WeatherInitialState extends WeatherState{}
class GetWeatherDataLoadingState extends WeatherState{}
class GetWeatherDataSuccessState extends WeatherState{}
class GetWeatherDataErrorState extends WeatherState{
  final String error;
  GetWeatherDataErrorState(this.error);
}