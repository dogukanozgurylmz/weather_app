import 'package:flutter/material.dart';
import 'package:weather_app/app/core/get_it/get_it.dart';
import 'package:weather_app/app/core/navigation_helper/navigation_helper.dart';
import 'package:weather_app/app/presentation/home/view/home_view.dart';
import 'package:weather_app/app/presentation/home/viewmodel/home_viewmodel.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    await getIt.get<HomeViewModel>().getWeatherData();
    Navigation.pushReplace(page: const HomeView());
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
