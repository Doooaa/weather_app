import 'dart:ui';
import 'weather_data_screen.dart';
import 'package:flutter/material.dart';
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
             //.......................................background..........
            body:new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          //generateBluredImage(),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:
  
            [
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
          )
          ]
          )
            
        )
        :DislayWeatherData(); 
  }
}
