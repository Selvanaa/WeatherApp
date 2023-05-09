import 'package:flutter/material.dart';

class WeatherModel {
  String date;
  double temp;
  double maxTemp;
  double minTemp;
  String weatherStateName;

  WeatherModel(
      {required this.date,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.weatherStateName});

  factory WeatherModel.fromJson(dynamic data) {
    var jsonData = data["forecast"]["forecastday"][0]['day'];
    return WeatherModel(
        date: data['location']['localtime'],
        temp: jsonData["avgtemp_c"],
        maxTemp: jsonData["maxtemp_c"],
        minTemp: jsonData["mintemp_c"],
        weatherStateName: jsonData["condition"]["text"]);
  }

  String getImage(){
    if(weatherStateName=='Clear'){
      return 'assets/images/clear.png';
    }
    else if(weatherStateName=='Cloudy'){
      return 'assets/images/cloudy.png';
    }
    else if(weatherStateName=='Dense fog'){
      return 'assets/images/Dense fog.png';
    }
    else if(weatherStateName=='Drizzle'){
      return 'assets/images/drizzle.png';
    }
    else if(weatherStateName=='Freezing Rain'){
      return 'assets/images/freezing_rain.png';
    }
    else if(weatherStateName=='Light Clouds'){
      return 'assets/images/light clouds.png';
    }
    else if(weatherStateName=='Partly Cloudy'){
      return 'assets/images/partly cloudy.png';
    }
    else if(weatherStateName=='Rain'|| weatherStateName=='Patchy rain possible'){
      return 'assets/images/rain.png';
    }
    else if(weatherStateName=='Rain and snow'){
      return 'assets/images/rain and snow.png';
    }
    else if(weatherStateName=='Sandstorm'){
      return 'assets/images/sandstorm.png';
    }
    else if(weatherStateName=='Snow'|| weatherStateName=='Moderate or heavy snow showers'){
      return 'assets/images/snow.png';
    }
    else if(weatherStateName=='Thunderstorms'){
      return 'assets/images/thunderstorms.png';
    }
    else {
      return 'assets/images/clear.png';
    }
  }

  MaterialColor getColor(){
    if(weatherStateName=='Clear'|| weatherStateName=='Sunny'){
      return Colors.orange;
    }
    else if(weatherStateName=='Cloudy'){
      return Colors.blue;
    }
    else if(weatherStateName=='Dense fog'){
      return Colors.blueGrey;
    }
    else if(weatherStateName=='Drizzle'){
      return Colors.blueGrey;
    }
    else if(weatherStateName=='Freezing Rain'){
      return Colors.grey;
    }
    else if(weatherStateName=='Light Clouds'){
      return Colors.orange;
    }
    else if(weatherStateName=='Partly Cloudy'){
      return Colors.orange;
    }
    else if(weatherStateName=='Rain'|| weatherStateName=='Patchy rain possible'){
      return Colors.blue;
    }
    else if(weatherStateName=='Rain and snow'){
      return Colors.blueGrey;
    }
    else if(weatherStateName=='Sandstorm'){
      return Colors.grey;
    }
    else if(weatherStateName=='Snow'|| weatherStateName=='Moderate or heavy snow showers'){
      return Colors.grey;
    }
    else if(weatherStateName=='Thunderstorms'){
      return Colors.blueGrey;
    }
    else {
      return Colors.blue;
    }
  }
}
