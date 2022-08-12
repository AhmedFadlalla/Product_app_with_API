import 'package:bloc/bloc.dart';
import 'package:e_commerce/layouts/shop_app/cubit/states.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/shop_app/categories_model.dart';
import '../../../models/shop_app/change_fav_model.dart';
import '../../../models/shop_app/home_layout_model.dart';
import '../../../models/shop_app/login_model.dart';
import '../../../modulus/shop_app/categories/categories.dart';
import '../../../modulus/shop_app/favorite/favorite.dart';
import '../../../modulus/shop_app/product/product.dart';
import '../../../shared/component/constants.dart';
import '../../../shared/network/endpoints.dart';
import '../../../shared/network/remote/dio.dart';


class HomeLayoutCubit extends Cubit<HomeLayoutStates> {
  HomeLayoutCubit() :super(HomeLayoutInitialState());

  static HomeLayoutCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> bottomNavigationScreens = [
    const ProductScreen(),
    const CategoriesScreen(),
    const CartsScreen(),



  ];

  List<BottomNavigationBarItem> bottomNavHomeItems = [
    const BottomNavigationBarItem(
        icon: Icon(
            Icons.home

        ),
        label: 'Home'),
    const BottomNavigationBarItem(
        icon: Icon(
            Icons.apps

        ),
        label: 'Categories'),
    const BottomNavigationBarItem(
        icon: Icon(
            Icons.shopping_cart
        ),
        label: 'My Cart'),




  ];

  int count=1;
  void incrementCount(){
    count++;
    emit(ChangeCountItemState());
  }

  void decrementCount(){
    count--;
    emit(ChangeCountItemState());
  }
  void changeBottomNavItems(int index) {

    if(index==2)
      {
        getDataFromCart();
      }
    currentIndex = index;
    emit(HomeLayoutChangeIndexState());
  }

   late HomeModel homeModel;
  Map<int, bool>favorite={};

  void getHomeData() {
    emit(HomeLayoutLoadingState());
    DioHelper.getData(
        url: HOME,
      token: token

    ).then((value) {
      homeModel=HomeModel.fromJson(value.data);
      emit(HomeLayoutSuccessfulState());
    }).catchError((error){

      if (kDebugMode) {
        print(error.toString());
      }
      emit(HomeLayoutErrorState(error.toString()));
    });
  }

  late CategoriesModel categoriesModel;

  void getCategoriesData() {
    emit(HomeLayoutLoadingState());
    DioHelper.getData(
        url: CATEGORIES,
        token: token)
        .then((value) {
      categoriesModel = CategoriesModel.fromJson(value.data);

      emit(CategoriesLayoutSuccessfulState());
    }).catchError((error) {
      print(error.toString());
      emit(CategoriesLayoutErrorState(error.toString()));
    });
  }

 late ChangeFavoriteModel changeFavoriteModel;
  void changeFavoriteList(int productId) {

    DioHelper.postData(
        url:FAVORITE,
        data: {
          'product_id':productId

        },
    token: token)
        .then((value) {
          changeFavoriteModel=ChangeFavoriteModel.fromJson(value.data);
          emit(FavoriteLayoutSuccessfulState());
    }).catchError((
        error) {
      emit(FavoriteLayoutErrorState(error.toString()));
    });
  }


   ShopLoginModel? userData;

  void getUserData()
  {

    DioHelper.getData(
        url: PROFILE,
        token: token
    ).then((value) {
      userData=ShopLoginModel.fromJson(value.data);
      if (kDebugMode) {
        print(userData!.data!.name);
      }
      emit(UserDataLayoutSuccessfulState(userData!));
    }).catchError((error){
      if (kDebugMode) {
        print(error.toString());
      }
      emit(UserDataLayoutErrorState(error.toString()));
    });
  }


  void addToCart({
  required int id,
    required dynamic price,
    required dynamic oldPrice,
    required dynamic discount,
    required String image,
    required String name,
    required bool inFavorite,
     bool inCart=true,
}){

    ProductModel model=ProductModel(
        id,
        price,
        oldPrice,
        discount,
        image,
        name,
        inFavorite,
        inCart);
    DioHelper.postData(
        url: Carts,
        data: model.toMap())
        .then((value) {
          emit(AddToCartSuccessState());

    }).catchError((error){
      if (kDebugMode) {
        print(error.toString());
      }
      emit(AddToCartErrorState(error.toString()));
    });
  }



  List<ProductModel> cart=[];
  void getDataFromCart(){

    DioHelper.getData(url: Carts)
        .then((value) {
      cart.add(value.data);
      emit(GetFromCartSuccessState());
    }).catchError((error){
      if (kDebugMode) {
        print(error.toString());
      }
      emit(GetFromCartErrorState(error.toString()));
    });

  }
}