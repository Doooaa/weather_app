import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class weatherModel {
  String cityName;
  String date;
  String state;
  String imageState;
  double av_temp;
  double  min_temp;
  double  max_temp;
  weatherModel(
      {required this.cityName,
      required this.date,
      required this.state,
      required this.imageState,
      required this.av_temp,
      required this.min_temp,
      required this.max_temp});

 factory weatherModel.fromjson(data) {
//factory to make it un nullabe 
  return weatherModel(
        cityName: data['location']['region'],
        date: data['location']['localtime'],
        state: data["forecast"]["forecastday"][0]["day"]["condition"]["text"],
        imageState: data["forecast"]["forecastday"][0]["day"]["condition"]
            ["icon"],
        av_temp: data["forecast"]["forecastday"][0]["day"]["avgtemp_c"],
        min_temp: data["forecast"]["forecastday"][0]["day"]["mintemp_c"],
        max_temp: data["forecast"]["forecastday"][0]["day"]["maxtemp_c"]);

 }
   MaterialColor  getThemColor(){
      if(state=='Sunny'||state=='Clear'||state=='light Cloud')
        {return Colors.orange;}
        else if(state=='Heavy Cloud'||state=='blue Grey')
        {return Colors.blueGrey;}
        else {
             return  Colors.blue;
    }
}}

