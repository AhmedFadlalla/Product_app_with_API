import 'package:bloc/bloc.dart';
import 'package:e_commerce/modulus/shop_app/shop_login/login_cubit/states.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../models/shop_app/login_model.dart';
import '../../../../shared/network/endpoints.dart';
import '../../../../shared/network/remote/dio.dart';

class loginCubit extends Cubit<loginStates>{
  loginCubit():super(loginInitialState());

  static loginCubit get(context)=>BlocProvider.of(context);

   late ShopLoginModel loginModel;
void userLogin ({
  required String email,
  required String password,
}){
  emit(loginLoadingState());
 DioHelper.postData(url: LOGIN, data: {
   'email':email,
   'password':password,
 }).then((value) {
   loginModel=ShopLoginModel.fromJson(value.data);
   emit(loginSuccefulState(loginModel));
 })
     .catchError((error){
   emit(loginErrorState(error.toString()));
 });

}

IconData suffixIcon=Icons.visibility;
bool isPassword=true;

void changePasswordVisibility(){

  isPassword=!isPassword;
  suffixIcon=isPassword?Icons.visibility:Icons.visibility_off;
  
  emit(loginChangePasswordVisibilityState());
}


}