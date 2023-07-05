import 'package:flutter/material.dart';
import 'package:weathr_app/pages/search_page.dart';

String getImage() {
  String state = weatherData!.state.toString();
  if (state == 'Sunny' || state == 'Clear' || state == 'light Cloud') {
    return 'asset/images/sunyy.jpg';
  } 
  else if (state == 'Heavy Cloud' || state == 'blue Grey') {
    return 'asset/images/clouds.jpg';
  } 
  else if (state == 'Sleet' ||
      state == 'Snow' ||
      state == 'Hail' ||
      state == 'light Rain' ||
      state == 'Showers') {
    return 'asset/images/snow.jpg';
  } 
  else {
    return 'asset/images/rain.jpg';
  }
}
