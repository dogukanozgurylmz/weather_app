import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:weather_app/app/core/extensions/build_context_extensions.dart';
import 'package:weather_app/app/data/models/weather_model.dart';
import 'package:weather_app/app/presentation/home/viewmodel/home_viewmodel.dart';
import 'package:weather_app/app/presentation/home/widgets/weather_date.dart';
import 'package:weather_app/app/presentation/home/widgets/weather_day.dart';
import 'package:weather_app/app/presentation/home/widgets/weather_degree.dart';
import 'package:weather_app/app/presentation/home/widgets/weather_icon.dart';

class WeatherMediumCard extends StatelessWidget {
  final WeatherModel weather;
  const WeatherMediumCard({
    super.key,
    required this.watch,
    required this.weather,
  });

  final HomeViewModel watch;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      height: 200,
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(36),
        color: Colors.lightBlue,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 4),
            blurRadius: 30,
            color: Colors.lightBlue.withOpacity(0.5),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            left: 16,
            top: 12,
            child: WeatherDate(
              watch: watch,
              fontSize: 16,
              date: weather.date!,
            )
                .animate()
                .moveY(
                  begin: context.width * 0.5,
                  end: 0,
                  duration: const Duration(milliseconds: 300),
                  delay: const Duration(milliseconds: 400),
                )
                .fade(),
          ),
          Positioned(
            left: 16,
            top: 28,
            child: WeatherDay(
              day: weather.day!,
              watch: watch,
              fontSize: 24,
            )
                .animate()
                .moveY(
                  begin: context.width * 0.5,
                  end: 0,
                  duration: const Duration(milliseconds: 300),
                  delay: const Duration(milliseconds: 500),
                )
                .fade(),
          ),
          Positioned(
            top: -20,
            right: -20,
            child: WeatherIcon(
              watch: watch,
              width: context.width * 0.5,
              icon: weather.icon!,
            )
                .animate()
                .moveY(
                  begin: context.width * 0.5,
                  end: 0,
                  duration: const Duration(milliseconds: 300),
                  delay: const Duration(milliseconds: 500),
                )
                .fade(),
          ),
          Positioned(
            left: context.width * 0.05,
            bottom: 0,
            child: WeatherDegree(
              watch: watch,
              degree: weather.degree!,
              fontSize: 84,
            )
                .animate()
                .moveY(
                  begin: context.width * 0.5,
                  end: 0,
                  duration: const Duration(milliseconds: 300),
                  delay: const Duration(milliseconds: 600),
                )
                .fade(),
          ),
        ],
      ),
    );
  }
}
