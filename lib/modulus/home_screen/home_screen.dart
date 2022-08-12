import 'package:e_commerce/modulus/home_screen/cubit/cubit.dart';
import 'package:e_commerce/modulus/home_screen/cubit/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

import '../../shared/component/constants.dart';

class WeatherHomeScreen extends StatelessWidget {
  const WeatherHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherCubit, WeatherState>(
        builder: (context, state) {
          return Scaffold(
            body: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        colorFilter:
                        ColorFilter.mode(Colors.black38, BlendMode.darken),
                        image: AssetImage(
                          'assets/images/cloud-in-blue-sky.jpg',
                        ),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25),
                      ),
                    ),
                    child: Stack(
                      children: <Widget>[
                        Container(
                          child: AppBar(
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                            leading: IconButton(
                              icon: const Icon(
                                Icons.menu,
                                color: Colors.white,
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ),
                        //TODO
                        Container(
                          padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
                          child: TextField(
                            // onChanged: (value) => controller.city = value,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                            textInputAction: TextInputAction.search,
                            // onSubmitted: (value) => controller.updateWeather(),
                            decoration: InputDecoration(
                              suffix: const Icon(
                                Icons.search,
                                color: Colors.white,
                              ),
                              hintStyle: const TextStyle(color: Colors.white),
                              hintText: 'Search'.toUpperCase(),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(color: Colors.white),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(color: Colors.white),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: const Alignment(0.0, 1.0),
                          child: SizedBox(
                            height: 10,
                            width: 10,
                            child: OverflowBox(
                              minWidth: 0.0,
                              maxWidth: MediaQuery.of(context).size.width,
                              minHeight: 0.0,
                              maxHeight: (MediaQuery.of(context).size.height / 4),
                              child: Stack(
                                children: <Widget>[
                                  Container(
                                    padding:const EdgeInsets.symmetric(horizontal: 15),
                                    width: double.infinity,
                                    height: double.infinity,
                                    child: Card(
                                      color: Colors.white,
                                      elevation: 5,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        children: <Widget>[
                                          //TODO
                                          Container(
                                            padding:const EdgeInsets.only(
                                                top: 15, left: 20, right: 20),
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Center(
                                                  child: Text(
                                                    'name'
                                                        .toUpperCase(),
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .caption!
                                                        .copyWith(
                                                      color: Colors.black45,
                                                      fontSize: 24,
                                                      fontWeight:
                                                      FontWeight.bold,
                                                      fontFamily:
                                                      'flutterfonts',
                                                    ),
                                                  ),
                                                ),
                                                Center(
                                                  child: Text(
                                                    DateFormat()
                                                        .add_MMMMEEEEd()
                                                        .format(DateTime.now()),
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .caption!
                                                        .copyWith(
                                                      color: Colors.black45,
                                                      fontSize: 16,
                                                      fontFamily:
                                                      'flutterfonts',
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const Divider(),
                                          //TODO
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Container(
                                                padding:const EdgeInsets.only(left: 50),
                                                child: Column(
                                                  children: <Widget>[
                                                    Text(
                                                      'desc',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .caption!
                                                          .copyWith(
                                                        color: Colors.black45,
                                                        fontSize: 22,
                                                        fontFamily:
                                                        'flutterfonts',
                                                      ),
                                                    ),
                                                    const SizedBox(height: 10),
                                                    Text(
                                                      '${(WeatherCubit.get(context).currentWeatherData!.main!.temp! - 273.15).round().toString()}\u2103',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headline2!
                                                          .copyWith(
                                                          color: Colors.black45,
                                                          fontFamily:
                                                          'flutterfonts'),
                                                    ),
                                                    Text(
                                                      'min: ${
                                                          (WeatherCubit.get(context).currentWeatherData!.main!.tempMin - 273.15)
                                                              .round().toString()}\u2103 / max: ${
                                                          (WeatherCubit.get(context).currentWeatherData!.main!
                                                          .tempMax
                                                      - 273.15).round().toString()}\u2103',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .caption!
                                                          .copyWith(
                                                        color: Colors.black45,
                                                        fontSize: 14,
                                                        fontWeight:
                                                        FontWeight.bold,
                                                        fontFamily:
                                                        'flutterfonts',
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                padding: EdgeInsets.only(right: 20),
                                                child: Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    SizedBox(
                                                      width: 120,
                                                      height: 120,
                                                      child: LottieBuilder.asset(
                                                          Images.cloudy_mains),
                                                    ),
                                                    Container(
                                                      child: Text(
                                                        'wind ${WeatherCubit.get(context).currentWeatherData!.wind!.speed} m/s',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .caption!
                                                            .copyWith(
                                                          color: Colors.black45,
                                                          fontSize: 14,
                                                          fontWeight:
                                                          FontWeight.bold,
                                                          fontFamily:
                                                          'flutterfonts',
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Stack(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Container(
                          padding: EdgeInsets.only(top: 120),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'other city'.toUpperCase(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption!
                                      .copyWith(
                                    fontSize: 16,
                                    fontFamily: 'flutterfonts',
                                    color: Colors.black45,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        'forcast next 5 days'.toUpperCase(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .caption!
                                            .copyWith(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black45,
                                        ),
                                      ),
                                      Icon(
                                        Icons.next_plan_outlined,
                                        color: Colors.black45,
                                      ),
                                    ],
                                  ),
                                ),
                                
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        listener: (context, state) {});
  }
}
