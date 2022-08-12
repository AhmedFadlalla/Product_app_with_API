// import 'package:e_commerce/models/five_days_data.dart';
// import 'package:e_commerce/shared/network/remote/api_repo.dart';
//
// import '../models/current_weather_data.dart';
//
// class WeatherService{
//  final String? city;
//
//   WeatherService({required this.city});
//
//   //https://api.openweathermap.org/data/2.5/weather?q=cairo&mode=json&appid=209639472709061043ad098a26b2a3f9
//
//   String baseUrl="https://api.openweathermap.org/data/2.5";
//   String apiKey="appid=209639472709061043ad098a26b2a3f9";
//
//
//
//   //http://api.openweathermap.org/data/2.5/forecast?q=cairo&appid=209639472709061043ad098a26b2a3f9
//   void getCurrentWeatherData({
//     Function()? beforSend,
//     Function(CurrentWeatherData currentWeatherData)? onSuccess,
//     Function(dynamic error)? onError,
// }){
//     final url="$baseUrl/weather?q=$city&$apiKey";
//     ApiRepo(url: url,payload: null).getData(
//       beforeSend: ()=>beforSend!(),
//       onSuccess: (data)=>onSuccess!(CurrentWeatherData.fromJson(data)),
//       onError: (error)=>onError!(error)
//     );
//
//
//   }
//
//  void getFiveThreeHourForcastData({
//    Function()? beforSend,
//    Function(List<FiveDayData>fiveDayData)? onSuccess,
//    Function(dynamic error)? onError,
//  }){
//    final url="$baseUrl/forecast?q=$city&$apiKey";
//    ApiRepo(url: url,payload: null).getData(
//        beforeSend: ()=>beforSend!(),
//        onSuccess: (data)=>{
//          onSuccess!((data['list']as List)
//            .map((t) =>FiveDayData.fromJson(t)
//        ).toList())
//        },
//        onError: (error)=>onError!(error)
//    );
//
//
//  }
//
// }