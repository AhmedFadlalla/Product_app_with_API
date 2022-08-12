




import 'package:flutter/cupertino.dart';

import '../network/local/cach_helper.dart';


class Images{
  Images._();
  static const String cloudy="asstes/anims/cloudy";
  static const String cloudy_mains="asstes/anims/cloudy_main";
}
List<Map> tasks=[];

void signOut(context){
  CachHelper.removeData(key: 'token').then((value) {
    if(value){
      // navigateTo(context, ShopLoginScreen());
    }

  });
}

void printFullText(String text){
  final pattern=RegExp('.{1,800}');
  pattern.allMatches(text).forEach((match) =>print(match.group(0)));


}
String? token;

String? uId;
String apiKey="appid=209639472709061043ad098a26b2a3f9";

//baseUrl: http://newsapi.org/
// methode: v2/top-headlines?
// quires: country=eg&category=business&apiKey=6548987cacc64a19a4e82084fce1b2fe


//https://newsapi.org/
// v2/everything?
// q=tesla&apiKey=6548987cacc64a19a4e82084fce1b2fe