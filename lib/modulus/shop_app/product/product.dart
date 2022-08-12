



import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:e_commerce/shared/component/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../layouts/shop_app/cubit/cubit.dart';
import '../../../layouts/shop_app/cubit/states.dart';
import '../../../models/shop_app/categories_model.dart';
import '../../../models/shop_app/home_layout_model.dart';
import '../../../shared/styles/colors.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeLayoutCubit, HomeLayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
            condition: state is HomeLayoutSuccessfulState ,
            builder: (context) =>
                productBuilder(HomeLayoutCubit.get(context).homeModel,HomeLayoutCubit.get(context).categoriesModel,context),
            fallback: (context) => const Center(child: CircularProgressIndicator()));
      },
    );
  }

  Widget productBuilder(HomeModel model,CategoriesModel categoriesModel,context) => SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
                items: model.data.banners
                    .map((e) => Image(
                          image: NetworkImage(e.image),
                          width: double.infinity,
                          height: 200.0,
                          fit: BoxFit.cover,
                        ))
                    .toList(),
                options: CarouselOptions(
                  height: 250.0,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  autoPlayAnimationDuration: const Duration(seconds: 1),
                  scrollDirection: Axis.horizontal,
                  viewportFraction: 1.0,
                )),
            const SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Categories',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w800
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  SizedBox(
                    height: 100.0,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: ( context,index)=>
                            buildCategoryItem(categoriesModel.data.categoriesData[index]),
                        separatorBuilder: ( context,index)=>const SizedBox(
                          width: 10.0,
                        ),
                        itemCount:categoriesModel.data.categoriesData.length),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const Text(
                    'New Product',
                    style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.w800
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Container(
              color: Colors.grey[300],
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                childAspectRatio: 1 / 1.54,
                crossAxisSpacing: 1.0,
                mainAxisSpacing: 1.0,
                children: List.generate(model.data.products.length,
                    (index) =>buildProductItem(HomeLayoutCubit.get(context).homeModel.data.products[index],context,index) ),
              ),
            )
          ],
        ),
      );

  Widget buildProductItem(ProductModel model,context,index)=>Container(
    color: Colors.white,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:  [
        Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [
            Image(
                image: NetworkImage(model.image),
              width: double.infinity,
              height: 190,
            ),
            if(model.discount !=0)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
              color: Colors.red,
              child: const Text(
                  'discount',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white
                ),
              ),
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              model.name,
              style:const  TextStyle(
                fontSize: 14.0,
                height: 1.2,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),

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
                const Spacer(),
                IconButton(
                    onPressed: (){

                    },
                    icon: const CircleAvatar(
                      radius: 15.0,
                      backgroundColor: Colors.grey,
                      child: Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                      ),
                    )
                )
              ],
            )
          ],
        ),
        Center(
          child: defaultButton(function: (){
            HomeLayoutCubit.get(context).addToCart(
                id:HomeLayoutCubit.get(context).homeModel.data.products[index].id ,
                price: HomeLayoutCubit.get(context).homeModel.data.products[index].price,
                oldPrice: HomeLayoutCubit.get(context).homeModel.data.products[index].oldPrice,
                discount: HomeLayoutCubit.get(context).homeModel.data.products[index].discount,
                image: HomeLayoutCubit.get(context).homeModel.data.products[index].image,
                name: HomeLayoutCubit.get(context).homeModel.data.products[index].name,
                inFavorite: HomeLayoutCubit.get(context).homeModel.data.products[index].inFavorite);
          }, text: 'Add To Cart'),
        )
      ],
    ),
  );
  Widget buildCategoryItem(ListOfCategoriesDataModel model)=>Stack(

    alignment: AlignmentDirectional.bottomCenter,
    children: [
      Image(
        image: NetworkImage(
            model.image),
        width: 100.0,
        height: 100.0,
        fit: BoxFit.cover,
      ),
      Container(
        width: 100.0,
        color: Colors.black.withOpacity(0.8),
        child: Text(
          model.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 17.0,
          ),
        ),
      )
    ],
  );
}
