
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/cubit.dart';
import 'cubit/states.dart';

class ShopLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return BlocConsumer<HomeLayoutCubit,HomeLayoutStates>(
        listener: (context,state){

        },
        builder: (context,state){

          var cubit=HomeLayoutCubit.get(context);

          return Scaffold(
            appBar: AppBar(
              title: Text('Camp'),
              actions: [
               IconButton( onPressed: (){
                 // navigateTo(context, ShopSearchScreen());
               },
                   icon: const Icon(
                       Icons.search
                   ),
               )

              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (index){
                  cubit.changeBottomNavItems(index);

              },
              items:cubit.bottomNavHomeItems ,
            ),
            body: cubit.bottomNavigationScreens[cubit.currentIndex],

          );
        },
      );
  }
}
