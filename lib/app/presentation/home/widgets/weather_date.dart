import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:weather_app/app/core/extensions/build_context_extensions.dart';
import 'package:weather_app/app/presentation/home/viewmodel/home_viewmodel.dart';

class WeatherDate extends StatelessWidget {
  final double fontSize;
  final String date;
  const WeatherDate({
    super.key,
    required this.watch,
    required this.fontSize,
    required this.date,
  });

  final HomeViewModel watch;

  @override
  Widget build(BuildContext context) {
    return Text(
      date,
      style: TextStyle(
        color: Colors.white.withOpacity(0.7),
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
      ),
    )
        .animate()
        .moveY(
          begin: context.width * 0.5,
          end: 0,
          duration: const Duration(milliseconds: 300),
          delay: const Duration(milliseconds: 500),
        )
        .fade();
  }
}
