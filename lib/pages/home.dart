import 'package:flutter/material.dart';
import 'package:weathr_app/weather_model.dart';
import 'package:weathr_app/pages/search_page.dart';

class home_page extends StatelessWidget {
   home_page({super.key});
   weatherModel? weatherData;
  @override
  Widget build(BuildContext context) {
    return weatherData!=null?Scaffold(
      body: Column(
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
                      Navigator.push(context, 
                      MaterialPageRoute(builder: (context) => SearchPage()),);
                    },
                    icon: Icon(Icons.search),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ):Container(
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
            Spacer(flex: 3,),
           Text("cario",style: TextStyle(
             fontSize: 27,
             fontWeight: FontWeight.bold,
           ),),
            Text("2023-7-2",style: TextStyle(
             fontSize: 12,
             fontWeight: FontWeight.bold,
           ),),
           Spacer(),
            Row(
              children: [
              
             Expanded(
               child: Image.network(
                         'https://media.istockphoto.com/id/1218939051/photo/asian-model-in-the-water-enjoying-a-wellness-spa.jpg?s=2048x2048&w=is&k=20&c=lkBPElSUEOhwY6O5Bwe0-Emgc27WdTC7wApMgUIL45Y=', // Replace with your image URL
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
                 Expanded(child: Text('30')),
                 Expanded(child: Text('30')),
                 Expanded(child: Text('30')),
               

              ],
            ),
            Spacer(),
            Text('endddddddddd'),
            Spacer(flex: 3,),
        ],
      ),

    );
  }
}
