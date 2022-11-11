import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loapi_test/weather.dart';

class WeatherScreen extends StatefulWidget {
  WeatherScreen({@required this.weatherService});

  final WeatherService weatherService;

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  double temperature;
  String weatherIcon;
  String cityName;

  @override
  void initState() {
    super.initState();
    this.updateUI();
  }

  void updateUI() {
    setState(() {
      temperature = widget.weatherService.temperature;
      weatherIcon = widget.weatherService.weatherIcon;
      cityName = widget.weatherService.cityName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            Image(
              image: NetworkImage(
                  'https://openweathermap.org/img/wn/$weatherIcon@2x.png'),
            ),
            Text(
              cityName,
              style: GoogleFonts.redressed(fontSize: 40),
            ),
            Text('$temperature Celcius', style: TextStyle(fontSize: 25)),
          ],
        ),
      )),
    );
  }
}
