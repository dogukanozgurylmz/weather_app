// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:weather_app/app/core/extensions/build_context_extensions.dart';

import 'package:weather_app/app/presentation/home/viewmodel/home_viewmodel.dart';

class WeatherIcon extends StatelessWidget {
  final double width;
  final String icon;
  const WeatherIcon({
    super.key,
    required this.width,
    required this.watch,
    required this.icon,
  });

  final HomeViewModel watch;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Image.network(
        icon,
        width: width,
      ),
    )
        .animate()
        .moveY(
          begin: context.width * 0.5,
          end: 0,
          duration: const Duration(milliseconds: 300),
          delay: const Duration(milliseconds: 400),
        )
        .fade();
  }
}
