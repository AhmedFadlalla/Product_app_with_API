class Weather{

  late int id;
  late String main;
  late String description;
  late String icon;


  Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon
  });


  factory Weather.fromJson(Map<String,dynamic>json){
    return Weather(
      id: int.parse(json['id']),
      description: json['description'] ,
      icon: json['icon'],
      main:json['main'] ,
    );
  }


  Map<String,dynamic> toJson(){
    return {
      'id':id,
      'main':main,
      'description':description,
      'icon':icon
    };
  }





}