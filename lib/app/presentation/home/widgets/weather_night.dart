import 'package:flutter/material.dart';
import 'package:weather_app/app/presentation/home/viewmodel/home_viewmodel.dart';

class WeatherNight extends StatelessWidget {
  final String night;
  const WeatherNight({
    super.key,
    required this.watch,
    required this.night,
  });

  final HomeViewModel watch;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          night,
          style: TextStyle(
            color: Colors.white.withOpacity(0.7),
            fontSize: 40,
            fontWeight: FontWeight.normal,
          ),
        ),
        Text(
          "Gece",
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
