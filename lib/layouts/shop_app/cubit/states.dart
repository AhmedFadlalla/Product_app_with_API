

import 'package:e_commerce/models/shop_app/login_model.dart';

abstract class HomeLayoutStates{}

class HomeLayoutInitialState extends HomeLayoutStates{}


class HomeLayoutChangeIndexState extends HomeLayoutStates{}

class HomeLayoutLoadingState extends HomeLayoutStates{}
class HomeLayoutSuccessfulState extends HomeLayoutStates{}
class HomeLayoutErrorState extends HomeLayoutStates{
  final String error;

  HomeLayoutErrorState(this.error);

}

class CategoriesLayoutLoadingState extends HomeLayoutStates{}
class CategoriesLayoutSuccessfulState extends HomeLayoutStates{}
class CategoriesLayoutErrorState extends HomeLayoutStates{
  final String error;

  CategoriesLayoutErrorState(this.error);

}

class FavoriteLayoutSuccessfulState extends HomeLayoutStates{}
class FavoriteLayoutErrorState extends HomeLayoutStates{
  final String error;

  FavoriteLayoutErrorState(this.error);

}

class UserDataLayoutSuccessfulState extends HomeLayoutStates{
  ShopLoginModel loginModel;
  UserDataLayoutSuccessfulState(this.loginModel);
}
class UserDataLayoutErrorState extends HomeLayoutStates{
  final String error;

  UserDataLayoutErrorState(this.error);

}
class ChangeCountItemState extends HomeLayoutStates{}

class AddToCartLoadingState extends HomeLayoutStates{}
class AddToCartSuccessState extends HomeLayoutStates{}
class AddToCartErrorState extends HomeLayoutStates{
  final String error;

  AddToCartErrorState(this.error);
}
class GetFromCartLoadingState extends HomeLayoutStates{}
class GetFromCartSuccessState extends HomeLayoutStates{}
class GetFromCartErrorState extends HomeLayoutStates{
  final String error;

  GetFromCartErrorState(this.error);
}
