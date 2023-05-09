import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/Cubits/weather_cubits/weather_cubit.dart';
import 'package:weatherapp/Model/weatherModel.dart';
import 'package:weatherapp/Providers/weatherProviders.dart';
import 'package:weatherapp/View/service/weatherService.dart';

class search extends StatelessWidget {
  String? cityName;
  search({this.updateUi});
  VoidCallback? updateUi;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
          title: Text(
            'Search a city',
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Center(
            child: TextField(
              onChanged: (data){
                cityName = data;
              },
              onSubmitted: (data) async
              {
                cityName = data;
                BlocProvider.of<WeatherCubit>(context).getWeather(cityName: cityName!);
                BlocProvider.of<WeatherCubit>(context).cityName=cityName;
                Navigator.pop(context);
              },
              decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                  labelText: 'Search',
                  hintText: 'Enter a city',
                  suffixIcon: GestureDetector(
                    onTap:() async
                    {
                      WeatherService service = WeatherService();
                      WeatherModel? weather =
                          await service.getWeather(cityName: cityName!);
                      Provider.of<WeatherProvider>(context, listen: false).WeatherData = weather;
                      Provider.of<WeatherProvider>(context, listen: false).cityName = cityName;
                      updateUi!();
                      Navigator.pop(context);
                    },

                      child: Icon(Icons.search)),
                  border: OutlineInputBorder()),
            ),
          ),
        ),
      ),
    );
  }
}
