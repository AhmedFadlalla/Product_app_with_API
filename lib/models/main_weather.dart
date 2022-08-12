class MainWeather{

  late double temp,feelsLike,tempMin,tempMax,pressure,humidity,seaLevel,grndLevel;


  MainWeather({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
    required this.seaLevel,
    required this.grndLevel
  });


  factory MainWeather.fromJson(Map<String,dynamic>json){
    return MainWeather(
      temp: double.parse(json['temp']),
      feelsLike: double.parse(json['feelsLike']) ,
      tempMin: double.parse(json['tempMin']),
      tempMax:double.parse(json['tempMax']) ,
      pressure: double.parse(json['pressure']),
      humidity: double.parse(json['humidity']) ,
      seaLevel: double.parse(json['seaLevel']),
      grndLevel:double.parse(json['grndLevel']) ,
    );
  }


  Map<String,dynamic> toJson() {
    return {
      'temp': temp,
      'feelsLike': feelsLike,
      'tempMin': tempMin,
      'tempMax': tempMax,
      'pressure': pressure,
      'humidity': humidity,
      'seaLevel': seaLevel,
      'grndLevel': grndLevel
    };
  }



}