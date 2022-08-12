

import '../../../../models/shop_app/login_model.dart';

abstract class loginStates{}

class loginInitialState extends loginStates{}

class loginLoadingState extends loginStates{}
class loginSuccefulState extends loginStates{
  final ShopLoginModel loginModel;
  loginSuccefulState(this.loginModel);
}
class loginErrorState extends loginStates{
  final String error;
  loginErrorState(this.error);
}
class loginChangePasswordVisibilityState extends loginStates{}

