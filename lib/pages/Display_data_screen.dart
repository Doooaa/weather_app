import 'dart:ui';
import 'home.dart';
import 'package:flutter/material.dart';
import 'package:weathr_app/pages/const.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:weathr_app/pages/search_page.dart';


class DislayWeatherData extends StatefulWidget {
  DislayWeatherData({Key? key}) : super(key: key);

  @override
  State<DislayWeatherData> createState() => _DislayWeatherDataState();
}

class _DislayWeatherDataState extends State<DislayWeatherData> {
 
  String image = getImage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            // Backdrop Filter for Frosted Glass Effect
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
              child: Container(
                  //  color: Color.fromARGB(255, 0, 53, 82).withOpacity(0.2),
                  ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [     
                Padding(
                  padding: const EdgeInsets.only(right: 300,top: 80,bottom: 22),
                  child: Container(
                    width: 48.0,
                    height: 48.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(24.0),
                      child: Material(
                        color: Colors.grey.withOpacity(0.3),
                        child: IconButton(
                          icon: const Icon(Icons.arrow_back_ios_new_rounded),
                          onPressed: () {
                             
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    '${weatherData!.cityName.toString()}',
                    style: const TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Text(
                  "${weatherData!.date.toString()}",
                  style:const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                      '${'https:' + weatherData!.imageState.toString()}',
                      loadingBuilder: (context, child, progress) {
                        if (progress == null) {
                          return child;
                        }
                        return CircularProgressIndicator();
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return Text('Error loading image');
                      },
                    ),
                    Text(
                      '${weatherData!.av_temp.round()}°C',
                      style: const TextStyle(
                        fontSize: 40,
                        color: Color.fromARGB(255, 10, 92, 146),
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                              color: Color.fromARGB(164, 222, 233, 237),
                              offset: Offset(4, 4),
                              blurRadius: 3),
                        ],
                      ),
                    ),
                  ],
                ),
               const   SizedBox(
                  height: 16,
                ),
                Text(
                  '${weatherData!.state.toString()}',
                  style: const TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 236, 238, 240),
                    shadows: [
                      Shadow(
                          color: Colors.blueGrey,
                          offset: Offset(6, 4),
                          blurRadius: 3),
                    ],
                  ),
                ),
                 const Spacer(),
                Container(
                  //padding: EdgeInsets.only(bottom: 122),
                  height: 170,
                  width: 360,
                  color: Color.fromARGB(121, 187, 229, 243),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //   crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const SizedBox(
                              width: 20,
                            ),
                            const Icon(Icons.thermostat_outlined,
                                size: 22,
                                color: Color.fromARGB(255, 255, 207, 61)),
                            Text(
                              ' Max Temperature :${weatherData!.max_temp.round()}°C',
                              style: StyleText(),
                            ),
                          ],
                        ),

                        //...........................
                        Row(
                          children: [
                            const SizedBox(
                              width: 20,
                            ),
                            const Icon(Icons.thermostat_outlined,
                                size: 22,
                                color: Color.fromARGB(255, 36, 176, 222)),
                            Text(
                                ' Min Temperature :${weatherData!.min_temp.round()}°C'
                                //,textAlign: TextAlign.center,
                                ,
                                style: StyleText())
                          ],
                        ),
                        //................................
                        Row(
                          children: [
                            const SizedBox(
                              width: 20,
                            ),
                           const  Icon(
                              WeatherIcons.day_windy,
                              size: 25,
                              color: Color.fromARGB(255, 7, 123, 181),
                            ),
                            const SizedBox(
                              width: 18,
                            ),
                            Text(
                                ' speed of the wind is: ${weatherData!.windSpeed.round()}°kph'
                                //,textAlign: TextAlign.center,
                                ,
                                style: StyleText())
                          ],
                        ),
                        //,,,,,,,,,,,,,,,,,,,,,,,,,,,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(
                              width: 20,
                            ),
                           const Icon(
                              WeatherIcons.cloudy,
                              size: 25,
                              color: const Color.fromARGB(255, 7, 105, 154),
                            ),
                            const SizedBox(
                              width: 18,
                            ),
                            Text(
                                'Clouds :${weatherData!.cloud.round()}'
                                //,textAlign: TextAlign.center,
                                ,
                                style: StyleText())
                          ],
                        ),
                      ]),
                ),
                const Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
