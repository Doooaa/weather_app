import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:weathr_app/pages/const.dart';
import 'package:weathr_app/pages/search_page.dart';


class DislayWeatherData extends StatefulWidget {
  DislayWeatherData({Key? key}) : super(key: key);

  @override
  State<DislayWeatherData> createState() => _DislayWeatherDataState();
}

class _DislayWeatherDataState extends State<DislayWeatherData> {
    String image=getImage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration:  BoxDecoration(
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            // Backdrop Filter for Frosted Glass Effect
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
              //  color: Color.fromARGB(255, 0, 53, 82).withOpacity(0.2),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(
                  flex: 3,
                ),
                Text(
                  '${weatherData!.cityName.toString()}',
                  style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "${weatherData!.date.toString()}",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Image.network(
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
                    ),
                    Expanded(
                      child: Text('${weatherData!.av_temp.toString()}'),
                    ),
                    Column(children: [
                      Text(
                          'max temperature :${weatherData!.max_temp.toString()}'),
                      Text(
                          'min temperature :${weatherData!.min_temp.toString()}')
                    ]),
                  ],
                ),
                Spacer(),
                Text(
                  '${weatherData!.state.toString()}',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Spacer(
                  flex: 5,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
