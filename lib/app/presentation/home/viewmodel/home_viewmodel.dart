import 'package:flutter/material.dart';
import 'package:weather_app/app/core/get_it/get_it.dart';
import 'package:weather_app/app/data/models/weather_model.dart';
import 'package:weather_app/app/data/repositories/weather_repository_impl.dart';
import 'package:weather_app/app/domain/repositories/weather_repository.dart';

class HomeViewModel extends ChangeNotifier {
  final WeatherRepository _weatherRepository =
      WeatherRepositoryImpl(remoteDatasource: getIt());

  final List<WeatherModel> weathers = [];
  final TextEditingController searchController = TextEditingController();

  Future<void> getWeatherData() async {
    weathers.clear();
    var dataResult = await _weatherRepository.getWeatherData();
    if (dataResult.success) {
      weathers.addAll(dataResult.data!.result!);
    }
    notifyListeners();
  }

  Future<void> search() async {
    weathers.clear();
    var dataResult =
        await _weatherRepository.search(searchController.text.trim());
    if (dataResult.success) {
      if (dataResult.data!.result == null) {
      } else {
        weathers.addAll(dataResult.data!.result!);
      }
    }
    notifyListeners();
  }
}
