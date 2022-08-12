
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../modulus/news_app/search_screen/search.dart';
import '../../shared/component/components.dart';


import 'cubit/cubit.dart';
import 'cubit/states.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return BlocConsumer<newsCubit,newsStates>(
           listener: (BuildContext context, state) {  },
           builder: (BuildContext context,  state) {
             newsCubit news=newsCubit.get(context);
             return Scaffold(
               appBar: AppBar(
                 title: Text("News App"),

                 actions: [
                   IconButton(
                       onPressed: (){
                         navigateTo(context,SearchScreen());
                       },
                       icon: Icon(Icons.search),),
                   IconButton(
                     onPressed: (){
                       // appCubit.get(context).changeMode();

                     },
                     icon: const Icon(Icons.brightness_6_rounded),)
                 ],
               ),
               body: news.newsScreens[news.currentIndex],
               bottomNavigationBar: BottomNavigationBar(
                 currentIndex: news.currentIndex,
                 onTap: (index){
                   news.changeIndex(index);
                 },
                 items: news.bottomItems,

               ),


             ) ;


           },

         );
  }
}
