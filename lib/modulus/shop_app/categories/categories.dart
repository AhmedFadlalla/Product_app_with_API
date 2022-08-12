
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../layouts/shop_app/cubit/cubit.dart';
import '../../../layouts/shop_app/cubit/states.dart';
import '../../../models/shop_app/categories_model.dart';
import '../../../shared/component/components.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeLayoutCubit,HomeLayoutStates>(
      listener:(context,state){

      } ,
      builder:(context,state){
        return ListView.separated(
            itemBuilder: (context,index)=>buildCatItem(HomeLayoutCubit.get(context).categoriesModel.data.categoriesData[index]),
            separatorBuilder: (context,index)=>myDivider(),
            itemCount: HomeLayoutCubit.get(context).categoriesModel.data.categoriesData.length);
      } ,
    );
  }

  Widget buildCatItem(ListOfCategoriesDataModel model)=>Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        Image(
          image:
          NetworkImage(
              model.image),
          width: 80,
          height: 80,
          fit: BoxFit.cover,),
        const SizedBox(width: 20,),
        Text(model.name,
          style: const TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,

          ),),
        const Spacer(),
        const Icon(Icons.arrow_forward_ios_outlined),


      ]
      ,
    ),
  );
}
