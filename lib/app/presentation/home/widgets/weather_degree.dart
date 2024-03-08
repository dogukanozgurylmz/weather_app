import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:weather_app/app/core/extensions/build_context_extensions.dart';
import 'package:weather_app/app/presentation/home/viewmodel/home_viewmodel.dart';

class WeatherDegree extends StatelessWidget {
  final String degree;
  final double fontSize;
  const WeatherDegree({
    super.key,
    required this.watch,
    required this.degree,
    required this.fontSize,
  });

  final HomeViewModel watch;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: double.parse(degree).toInt().toString(),
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          TextSpan(
            text: '°C',
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.w100,
              color: Colors.white,
              fontFeatures: const <FontFeature>[
                FontFeature.superscripts(),
              ],
            ),
          ),
        ],
      ),
    )
        .animate()
        .moveY(
          begin: context.width * 0.5,
          end: 0,
          duration: const Duration(milliseconds: 300),
          delay: const Duration(milliseconds: 200),
        )
        .fade();
  }
}
