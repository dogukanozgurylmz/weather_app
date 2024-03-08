import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/app/core/extensions/build_context_extensions.dart';
import 'package:weather_app/app/core/extensions/padding_extensions.dart';
import 'package:weather_app/app/presentation/home/viewmodel/home_viewmodel.dart';
import 'package:weather_app/app/presentation/home/widgets/search_widget.dart';
import 'package:weather_app/app/presentation/home/widgets/weather_large_card.dart';
import 'package:weather_app/app/presentation/home/widgets/weather_humidity.dart';
import 'package:weather_app/app/presentation/home/widgets/weather_medium_date.dart';
import 'package:weather_app/app/presentation/home/widgets/weather_night.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var watch = context.watch<HomeViewModel>();
    var read = context.read<HomeViewModel>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: watch.weathers.isEmpty
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text("Unknown data"),
                SearchWidget(read: read),
              ],
            ).allPadding(20)
          : SingleChildScrollView(
              child: Column(
                children: [
                  WeatherLargeCard(watch: watch),
                  Container(
                    width: context.width,
                    height: 120,
                    margin: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(36),
                      color: Colors.blue[900],
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 4),
                          blurRadius: 30,
                          color: Colors.blue[900]!.withOpacity(0.3),
                          spreadRadius: -5,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        WeatherHumidity(
                          watch: watch,
                          humidity: watch.weathers.first.humidity!,
                        )
                            .animate()
                            .moveY(
                              begin: context.width * 0.1,
                              end: 0,
                              duration: const Duration(milliseconds: 300),
                              delay: const Duration(milliseconds: 200),
                            )
                            .fade(),
                        WeatherNight(
                          watch: watch,
                          night: watch.weathers.first.night!,
                        )
                            .animate()
                            .moveY(
                              begin: context.width * 0.1,
                              end: 0,
                              duration: const Duration(milliseconds: 300),
                              delay: const Duration(milliseconds: 200),
                            )
                            .fade(),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  SearchWidget(read: read).symmetricPadding(horizontal: 20),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      var weather = watch.weathers[index];
                      if (index == 0) {
                        return const SizedBox(
                          height: 0,
                        );
                      }
                      return WeatherMediumCard(
                        watch: watch,
                        weather: weather,
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(height: 4);
                    },
                    itemCount: watch.weathers.length,
                  ),
                ],
              ),
            ),
    );
  }
}
