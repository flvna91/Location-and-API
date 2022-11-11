import 'dart:convert';

import 'location.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  double temperature;
  String weatherIcon;
  String cityName;

  static const API_KEY = 'e34ecd171976cc1e1a0960e1f8316e57';

  Future<dynamic> getWeatherData() async {
    LocationService locationService = LocationService();
    await locationService.getCurrentLocation();

    double lat = locationService.latitude;
    double lon = locationService.longtitude;

    http.Response response = await http.get(
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$API_KEY&units=metric');

    if (response.statusCode == 200) {
      String data = response.body;
      var weatherData = jsonDecode(data);

      temperature = weatherData['main']['temp'];
      weatherIcon = weatherData['weather'][0]['icon'];
      cityName = weatherData['name'];
    }
  }
}
