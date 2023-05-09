import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/Cubits/weather_cubits/weather_cubit.dart';
import 'package:weatherapp/Cubits/weather_cubits/weather_states.dart';
import 'package:weatherapp/Model/weatherModel.dart';
import 'package:weatherapp/Providers/weatherProviders.dart';
import 'package:weatherapp/View/Pages/search.dart';


class home extends StatelessWidget {


 


  WeatherModel? WeatherData;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Weather App'
          ),
          actions: [
            IconButton(
                onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>search(
                         
                      )
                      ));
                },
                icon: Icon(
              Icons.search
            )
            )
          ],
        ),

        body: BlocBuilder<WeatherCubit,WeatherState>(
          builder: ( context, state) {
            if(state is WeatherLoading){
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            else if(state is WeatherSuccess){
              WeatherData= BlocProvider.of<WeatherCubit>(context).weatherModel;
              return  Success(WeatherData: WeatherData);
            }
            else if( state is WeatherFailure){
              return Center(
                child: Text('Something went wrong please try again'),
              );
            }
            else {
              return  Default();
            }
          },

        ),

      ),
    );
  }
}

class Default extends StatelessWidget {
  const Default({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'There is no weather !'
                ' Start Searching now.',
            style: TextStyle(
                fontSize: 32,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold
            ),
          )
        ],
      ),
    );
  }
}

class Success extends StatelessWidget {
  const Success({
    Key? key,
    required this.WeatherData,
  }) : super(key: key);

  final WeatherModel? WeatherData;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors:[
                WeatherData!.getColor(),
                WeatherData!.getColor()[200]!,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter
          )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(flex: 3,),
          Column(
            children: [
              Text(
                BlocProvider.of<WeatherCubit>(context).cityName!,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32
                ),
              ),
              Text(
                'Updated at : ${WeatherData!.date}',
                style: TextStyle(
                    fontSize: 24
                ),
              )
            ],
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(WeatherData!.getImage(),

              ),
              Text(
                '${ WeatherData!.temp.toInt()}',
                style: TextStyle(
                    fontSize: 32
                ),
              ),
              Column(
                children: [
                  Text(
                    'MinTemp: ${WeatherData!.minTemp.toInt()}',
                    style: TextStyle(
                        fontSize: 18
                    ),
                  ),
                  Text(
                    'MaxTemp: ${WeatherData!.maxTemp.toInt()}',
                    style: TextStyle(
                        fontSize: 18
                    ),
                  )
                ],
              )
            ],
          ),
          Spacer(),
          Text(
            WeatherData?.weatherStateName?? '',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32
            ),
          ),
          Spacer(flex: 5,)
          ,
        ],
      ),
    );
  }
}
