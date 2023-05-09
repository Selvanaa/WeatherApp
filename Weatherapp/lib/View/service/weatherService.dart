import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weatherapp/Model/weatherModel.dart';

class WeatherService {
  String baseUrl = 'http://api.weatherapi.com/v1';
  String apiKey = 'cf577d32442b4019872210904221112';
  Future<WeatherModel?> getWeather({required String cityName}) async {
    WeatherModel ?weather;
   try{ Uri url = Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$cityName&aqi=no');
   http.Response response = await http.get(url);
   Map<String, dynamic> data = jsonDecode(response.body);

   weather = WeatherModel.fromJson(data);}
   catch(e){
     print(e);
   }
    return weather;
  }
}
