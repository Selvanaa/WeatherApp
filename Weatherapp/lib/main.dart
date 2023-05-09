import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/Cubits/weather_cubits/weather_cubit.dart';
import 'package:weatherapp/Providers/weatherProviders.dart';
import 'package:weatherapp/View/Pages/home.dart';
import 'package:weatherapp/View/service/weatherService.dart';

import 'Model/weatherModel.dart';
import 'Model/weatherModel.dart';
import 'Model/weatherModel.dart';
import 'Model/weatherModel.dart';

void main() {
  runApp(BlocProvider(
      create: (context) {
        return WeatherCubit(WeatherService());
      },
      child: WeatherApp()));
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: BlocProvider.of<WeatherCubit>(context).weatherModel == null ? Colors.orange :
        BlocProvider.of<WeatherCubit>(context).weatherModel!.getColor(),
      ),
      home: home(),
    );
  }
}
