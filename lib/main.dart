import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/app/core/get_it/get_it.dart';
import 'package:weather_app/app/core/navigation_helper/navigation_helper.dart';
import 'package:weather_app/app/presentation/home/viewmodel/home_viewmodel.dart';
import 'package:weather_app/app/presentation/splash/view/splash_view.dart';

void main() {
  setupGetIT();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => getIt.get<HomeViewModel>(),
        )
      ],
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: MaterialApp(
          title: 'Flutter Demo',
          navigatorKey: Navigation.navigationKey,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const SplashView(),
        ),
      ),
    );
  }
}
