import 'package:flutter/cupertino.dart';
import 'package:weatherapp/Model/weatherModel.dart';

class WeatherProvider extends ChangeNotifier {
  WeatherModel? _WeatherData;
  String ? cityName;
  set WeatherData(WeatherModel? weather){
    _WeatherData =weather;
    notifyListeners();
  }
  WeatherModel ?get WeatherData=> _WeatherData;
}
