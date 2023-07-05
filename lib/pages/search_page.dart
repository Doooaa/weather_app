import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:weathr_app/models/weather_model.dart';
import 'package:weathr_app/sevices/weather_serices.dart';

class SearchPage extends StatelessWidget {
  String? cityName;
  VoidCallback? updateUi;
  SearchPage({this.updateUi});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration:const BoxDecoration(
          image:  DecorationImage(
            image: AssetImage('asset/images/backForSearch.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 30, sigmaY: 20),
          child: Column(
            children: [
              Image.asset('asset/images/World Connection _Two Color.png'),
              Padding(
                padding: const EdgeInsets.fromLTRB(20,0, 20,0),
                child: TextField(
                  style: const TextStyle(color: Colors.white),
                  onSubmitted: (data) async {
                    cityName = data;
                    weatherServices service = weatherServices();
                    weatherModel weather =
                        await service.getweather(cityName: cityName!);
                    weatherData = weather;
                    updateUi!();
                    Navigator.pop(context);
                  },
                  decoration: InputDecoration(
                    hintStyle: const TextStyle(color: Colors.white70),
                    labelStyle: const TextStyle(color: Colors.white),
                    labelText: "Search",
                    hintText: 'Enter your city',
                    contentPadding: const EdgeInsets.all(25),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: const BorderSide(
                        color: Colors.white,
                        width: 2.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: const BorderSide(
                        color: Colors.white,
                        width: 2.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: const BorderSide(
                        color: Colors.white,
                        width: 2.0,
                      ),
                    ),
                    suffixIcon: const Icon(Icons.search, color: Colors.white),
                  ),
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}

weatherModel? weatherData;
