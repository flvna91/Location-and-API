import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loapi_test/weather.dart';
import 'package:loapi_test/weather_screen.dart';
//import 'package:locandapi/location.dart';
//import 'package:weather_application/home_screen.dart';

class HomeScreen extends StatefulWidget {
  //HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  WeatherService weatherService = WeatherService();

  @override
  void initState() {
    super.initState();
    this.getWeather();
  }

  void getWeather() async {
    await weatherService.getWeatherData();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return WeatherScreen(weatherService: weatherService);
    }));
  }
  /*void getLocation() async {
    LocationServices s = LocationServices();
    await s.getCurrentLocation();
  }*/

  @override
  Widget build(BuildContext context) {
    //getLocation();

    return Center(
      child: SpinKitRipple(
        color: Colors.white,
        size: 50,
      ),
    );
  }
}
