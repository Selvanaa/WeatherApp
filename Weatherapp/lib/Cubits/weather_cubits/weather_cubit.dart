import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/Cubits/weather_cubits/weather_states.dart';
import 'package:weatherapp/Model/weatherModel.dart';
import 'package:weatherapp/View/service/weatherService.dart';

class WeatherCubit extends Cubit<WeatherState>{

  WeatherService weatherService;
  String? cityName;
  WeatherModel ?weatherModel;

  WeatherCubit(this.weatherService):super(WeatherInitial());
  void getWeather({required String cityName}) async{
    emit(WeatherLoading());
    try {
     weatherModel= await weatherService.getWeather(cityName: cityName);
      emit(WeatherSuccess());
    }on Exception catch (e){
      emit(WeatherFailure());
    }
  }


}