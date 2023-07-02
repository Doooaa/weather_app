import 'package:flutter/material.dart';
import 'package:weathr_app/weather_model.dart';
import 'package:weathr_app/sevices/weather_serices.dart';

class SearchPage extends StatelessWidget {
  String? cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🌦 Discover the Weather'),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('asset/images/xx.gif'), fit: BoxFit.cover)),
        child: Center(
          child: TextField(
            style: TextStyle(color: Colors.white),
            onSubmitted: (data) async {
              cityName = data;
              weatherServices service = new weatherServices();
              weatherModel weather =
                  await service.getweather(cityName: cityName!);
              print(weather);
            },
            decoration: InputDecoration(
              hintStyle: TextStyle(color: Colors.white70),
              labelStyle: TextStyle(color: Colors.white),
              labelText: "Search",
              hintText: 'Enter your city',
              contentPadding: EdgeInsets.all(25),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: BorderSide(
                  color: Colors.white,
                  width: 2.0,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: BorderSide(
                  color: Colors.white,
                  width: 2.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: BorderSide(
                  color: Colors.white,
                  width: 2.0,
                ),
              ),
              suffixIcon: Icon(Icons.search, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
