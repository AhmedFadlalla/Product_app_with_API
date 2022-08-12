import 'package:e_commerce/layouts/shop_app/shop_layout.dart';
import 'package:e_commerce/modulus/home_screen/cubit/cubit.dart';
import 'package:e_commerce/shared/bloc_observer.dart';
import 'package:e_commerce/shared/component/constants.dart';
import 'package:e_commerce/shared/network/local/cach_helper.dart';
import 'package:e_commerce/shared/network/remote/api_repo.dart';
import 'package:e_commerce/shared/network/remote/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'layouts/news_layout/cubit/cubit.dart';
import 'layouts/news_layout/news_layout.dart';
import 'layouts/shop_app/cubit/cubit.dart';
import 'modulus/home_screen/home_screen.dart';
import 'modulus/shop_app/shop_login/shop_login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CachHelper.init();
  ApiRepo.init();
  token = CachHelper.getData(key: 'token');
  if (kDebugMode) {
    print(token);
  }

  Widget? startWidget;
  if (token != null) {
    startWidget = ShopLayout();
  }
  else {
    startWidget = ShopLoginScreen();
  }


  runApp( MyApp(startWidget: startWidget,));
}

class MyApp extends StatelessWidget {
  final Widget? startWidget;

  const MyApp({Key? key,  this.startWidget}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => WeatherCubit('cairo')..getCurrentWeatherData(),
        ),
        BlocProvider(
          create: (context) => newsCubit()
            ..getBusiness()
            ..getSports()
            ..getScience(),
        ),
        BlocProvider(
            create: (context) => HomeLayoutCubit()
              ..getHomeData()
              ..getCategoriesData()
              ..getUserData())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: startWidget,
      ),
    );
  }
}
