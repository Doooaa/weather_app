import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weathr_app/weather_model.dart';

class weatherServices {

  Future<weatherModel> getweather({required String cityName}) async {
    const String _baseUrl = 'https://api.weatherapi.com/v1';
    const String apikey="949da546823849d8967224730232406";

    http.Response response = await http.get(Uri.parse(
        '$_baseUrl/forecast.json?key=$apikey&q=$cityName&days=7'));
    Map<String, dynamic> data = jsonDecode(response.body);
   

    weatherModel weather=weatherModel.fromjson(data);
      return weather;
  }
}
