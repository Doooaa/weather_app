import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:weathr_app/weather_model.dart';
import 'package:weathr_app/pages/search_page.dart';


class home_page extends StatefulWidget {
  home_page({super.key});

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  //weatherModel? weatherData;
  void updateUi() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return weatherData == null
        ? Scaffold(
            appBar: AppBar(
              title: Text('hooooooom'),
            ),
            body:
              //.......................................background..........

               Column(
                
                
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "There is no weather data. Please search for a specified city!",
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          child: IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SearchPage(
                                          updateUi: updateUi,
                                        )),
                              );
                            },
                            icon: Icon(Icons.search),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            
        )
        : Scaffold(
            body: Container(
              color: Colors.blue,
              child: Column(
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
                    ),
                  ),
                  Text(
                    "${weatherData!.date.toString()}",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
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
                          child: Text('${weatherData!.av_temp.toString()}')),
                      Column(children: [
                        Text(
                            'max temprture :${weatherData!.max_temp.toString()}'),
                        Text(
                            'min temprture :${weatherData!.min_temp.toString()}')
                      ]),
                    ],
                  ),
                  Spacer(),
                  Text('${weatherData!.state.toString()}'),
                  Spacer(
                    flex: 5,
                  ),
                ],
              ),
            ),
          );
  }
}
