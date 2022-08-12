import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:e_commerce/layouts/shop_app/cubit/cubit.dart';
import 'package:e_commerce/layouts/shop_app/cubit/states.dart';
import 'package:e_commerce/models/shop_app/home_layout_model.dart';
import 'package:e_commerce/shared/component/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/styles/colors.dart';
import '../../../shared/styles/icon_broken.dart';

class CartsScreen extends StatelessWidget {
  const CartsScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {

    return  BlocConsumer<HomeLayoutCubit,HomeLayoutStates>(

        builder: (context,state){
          var cubit=HomeLayoutCubit.get(context);
          var count=state is ChangeCountItemState ?'${cubit.count}':1;

          return ConditionalBuilder(
              condition: cubit.cart.isNotEmpty,
              builder: (context)=>ListView.separated(
                itemBuilder: (context,index)=>buildCartItem(context, count,cubit.cart[index]),
                separatorBuilder:(context,index)=>myDivider() ,
                itemCount: cubit.cart.length,
              ),
              fallback: (context)=>const Center(child: Text('Your Cart is empty')));
        },
        listener: (context,state){

        });
  }
  
  
  Widget buildCartItem(context,count,ProductModel model)=>Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Card(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                Row(
                  children:  [
                     Image(
                      image: NetworkImage(
                        model.image
                      ),
                      width: 120,
                      fit: BoxFit.cover,

                    ),
                    const SizedBox(width: 10,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:  [
                        Text(
                          model.name,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 25
                          ),
                        ),
                        const SizedBox(height: 5,),
                       Row(
                         children: [
                           Text(
                             '${model.price.round()}',
                             style: const TextStyle(
                               fontSize: 12,
                               color: defaultColor,
                             ),
                           ),
                           const SizedBox(width: 5,),
                           if(model.discount !=0)
                             Text(
                               '${model.oldPrice.round()}',
                               style: const TextStyle(
                                   fontSize: 12,
                                   color: Colors.grey,
                                   decoration: TextDecoration.lineThrough
                               ),
                             ),
                         ],
                       )
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.grey.withOpacity(0.3)
                        ),
                        child: IconButton(onPressed: (){},
                            icon: const Icon(IconBroken.Delete))),
                    const SizedBox(
                      width: 8,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.grey.withOpacity(0.3),

                      ),
                      child: Row(


                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: IconButton(

                              onPressed: (){
                                HomeLayoutCubit.get(context).decrementCount();
                              },
                              icon: const Icon(Icons.minimize_sharp),


                            ),
                          ),
                          Text(
                            '$count',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18
                            ),
                          ),
                          IconButton(onPressed: (){
                            HomeLayoutCubit.get(context).incrementCount();
                          }, icon: const Icon(Icons.add))
                        ],
                      ),
                    ),
                    const Spacer(),
                    Text('$count X = ${1200*(model.price)}')

                  ],
                )

              ],
            ),
          ),
        ),
      )
    ],
  );
}
