class Coord{

  late double lon;
  late double lat;


  Coord({
    required this.lat,required this.lon
});


 factory Coord.fromJson(Map<String,dynamic>json){
    return Coord(lat: double.parse(json['lon']), lon: double.parse(json['lat']));
  }


  Map<String,dynamic> toJson(){
   return {
     "lon":lon,
     "lat":lat
   };
  }
}