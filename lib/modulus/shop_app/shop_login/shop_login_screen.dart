
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:e_commerce/shared/component/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../layouts/shop_app/shop_layout.dart';
import '../../../shared/network/local/cach_helper.dart';
import 'login_cubit/cubit.dart';
import 'login_cubit/states.dart';

class ShopLoginScreen extends StatelessWidget {


  ShopLoginScreen({Key? key}) : super(key: key);

  var formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var emailController=TextEditingController();
    String emailLabel='Email Address';

    var passwordController=TextEditingController();
    String passwordLabel='Password';
    return BlocProvider(
      create: (BuildContext context) =>loginCubit(),
      child: BlocConsumer<loginCubit,loginStates>(
        listener: (context,state){
          if(state is loginSuccefulState){
            if(state.loginModel.status){
              print(state.loginModel.message);
              print(state.loginModel.data!.token);
       CachHelper.saveData(key: 'token', value: state.loginModel.data!.token);
       navigateAndFinish(context, ShopLayout());
            }
            else{
              print(state.loginModel.message);
              showToast(text: state.loginModel.message, state:ToastStates.ERROR );
            }

          }

        },
        builder: (context,state){
          var cubit=loginCubit.get(context);
          return Scaffold(
            appBar:AppBar() ,
            body:Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'LOGIN',
                          style: Theme.of(context).textTheme.headline4!.copyWith(
                              color: Colors.black
                          ),

                        ),
                        Text(
                          'Login now to browse our hot offers',
                          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              color: Colors.grey
                          ),

                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        defaultFormField(
                            controller: emailController,
                            type: TextInputType.emailAddress,
                            validator: (value){
                              if(value.isEmpty){
                                return 'Email address must not be empty';
                              }
                               return null;

                            },
                            label: emailLabel,
                            prefixIcon: Icons.email_outlined),
                        const SizedBox(height: 20.0,),
                        defaultFormField(
                            controller: passwordController,
                            type: TextInputType.text,
                            validator: (value){
                              if(value.isEmpty){
                                return 'Password must not be empty';
                              }
                               return null;

                            },
                            onsubmit: (value){
                              if(formKey.currentState!.validate()){

                                cubit.userLogin(
                                    email: emailController.text,
                                    password: passwordController.text);

                              }
                            },
                            label: passwordLabel,
                            isPassword: cubit.isPassword,
                            suffixIcon: cubit.suffixIcon,
                            sufixPressed: (){
                              cubit.changePasswordVisibility();
                            },
                            prefixIcon: Icons.lock),
                        const SizedBox(
                          height: 20.0,
                        ),
                        ConditionalBuilder(
                            condition: state is! loginLoadingState,
                            builder: (context)=>defaultButton(
                                function: (){
                                  if(formKey.currentState!.validate()){

                                    cubit.userLogin(
                                        email: emailController.text,
                                        password: passwordController.text);

                                  }


                                },
                                text: 'LOGIN',
                                isUpperCase: true),
                            fallback:(context)=>  const Center(child: CircularProgressIndicator(),)),
                        const SizedBox(height: 20.0,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Don\'t have an account?'),
                            defaultTextButton(
                                pressedFunction: (){
                                  // navigateTo(context, ShopRegisterScreen());
                                },
                                text: 'Register now'

                            )
                          ],
                        )




                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
