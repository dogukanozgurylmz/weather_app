import 'package:flutter/material.dart';
import 'package:weather_app/app/presentation/home/viewmodel/home_viewmodel.dart';

class WeatherHumidity extends StatelessWidget {
  final String humidity;
  const WeatherHumidity({
    super.key,
    required this.watch,
    required this.humidity,
  });

  final HomeViewModel watch;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          humidity,
          style: TextStyle(
            color: Colors.white.withOpacity(0.7),
            fontSize: 40,
            fontWeight: FontWeight.normal,
          ),
        ),
        Text(
          "Nem",
          style: TextStyle(
            color: Colors.white.withOpacity(0.7),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
