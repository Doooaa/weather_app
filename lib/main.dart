import 'package:flutter/material.dart';
import 'package:weathr_app/pages/home.dart';
import 'package:weathr_app/pages/search_page.dart';


void main() {
  runApp(WeatherApp());
}
class WeatherApp extends StatelessWidget {
  const WeatherApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
       // primarySwatch: weatherData!.getThemColor(),
      ),
      debugShowCheckedModeBanner: false ,
      home: home_page(),
    );
  }
}