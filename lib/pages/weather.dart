import 'package:flutter/material.dart';
import 'package:weather/weather.dart';

class WeatherForecast extends StatefulWidget {
  const WeatherForecast({super.key});

  @override
  State<WeatherForecast> createState() => _WeatherForecastState();
}

class _WeatherForecastState extends State<WeatherForecast> {
  final WeatherFactory _wf = WeatherFactory("2fb168a2875c1f28acf2175b23496adf");
  Weather? _weather;
  @override
  void initState(){
    super.initState();
    _wf.currentWeatherByCityName("Mumbai").then((w){
      setState(){
        _weather = w;
      }
    });
  }
  Widget build(BuildContext context) {
    return Scaffold( 

      body: Build(),
    );
  }
  Widget Build(){
    if(_weather == null){
      return Center(child: CircularProgressIndicator());
    }
    return Column( 
      children: [ 
        
      ],
    );
  }
}