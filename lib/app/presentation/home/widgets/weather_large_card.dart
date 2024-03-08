import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weather_app/app/core/extensions/build_context_extensions.dart';
import 'package:weather_app/app/core/extensions/padding_extensions.dart';
import 'package:weather_app/app/presentation/home/viewmodel/home_viewmodel.dart';
import 'package:weather_app/app/presentation/home/widgets/weather_date.dart';
import 'package:weather_app/app/presentation/home/widgets/weather_day.dart';
import 'package:weather_app/app/presentation/home/widgets/weather_degree.dart';
import 'package:weather_app/app/presentation/home/widgets/weather_icon.dart';

class WeatherLargeCard extends StatelessWidget {
  const WeatherLargeCard({
    super.key,
    required this.watch,
  });

  final HomeViewModel watch;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      height: context.height * 0.4,
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(36),
        color: Colors.blue[900],
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 4),
            blurRadius: 30,
            color: Colors.blue[900]!.withOpacity(0.5),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.topCenter,
        fit: StackFit.expand,
        children: [
          WeatherIcon(
            watch: watch,
            width: context.width * 0.6,
            icon: watch.weathers.first.icon!,
          ),
          Positioned(
            left: 0,
            bottom: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                WeatherDay(
                  watch: watch,
                  fontSize: context.height * 0.09,
                  day: watch.weathers.first.day!,
                ),
                WeatherDate(
                  watch: watch,
                  fontSize: context.height * 0.03,
                  date: watch.weathers.first.date!,
                ),
                WeatherDegree(
                  watch: watch,
                  degree: watch.weathers.first.degree!,
                  fontSize: context.height * 0.15,
                ),
              ],
            ).symmetricPadding(horizontal: 20),
          ),
        ],
      ),
    );
  }
}
