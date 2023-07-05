import 'dart:ui';
import 'Display_data_screen.dart';
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
    if (weatherData == null) {
      return Scaffold(
          /*appBar: AppBar(
            title: const Text('weather App'),
            backgroundColor:  Color.fromARGB(117, 71, 134, 205),
          ),*/
          body: Container(
            decoration:const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('asset/images/home.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                  child: Container(
                    color: Color.fromARGB(255, 0, 53, 82).withOpacity(0.2),
                  ),
                ),
                //  Image.asset('asset/images/Ecology_Two Color.png',width:300,height: 300
                //      ,alignment: Alignment.topLeft,),
                Padding(
                  padding: const EdgeInsets.only(top: 330),
                  child: Container(
                    width: 350,
                    height: 110,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: Color.fromARGB(31, 57, 37, 240),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 10,),
                        const Expanded(
                          child: Text(
                            "There is no weather data.  search for a specified city ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18
                            ),
                          ),
                        ),
                        ElevatedButton(
                            child: const Text('Discover the Weather Now',style: TextStyle(
                              color:Color.fromARGB(255, 38, 29, 108),
                            ),),
                            style: ButtonStyle(
                               backgroundColor: MaterialStateProperty.all<Color>(Colors.white)
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SearchPage(
                                            updateUi: updateUi,
                                          )));
                            }),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ));
    } else {
      return DislayWeatherData();
    }
  }
}
