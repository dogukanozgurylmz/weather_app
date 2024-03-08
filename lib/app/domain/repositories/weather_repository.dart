import 'package:weather_app/app/core/result/result.dart';
import 'package:weather_app/app/data/models/weather_data_model.dart';

abstract class WeatherRepository {
  Future<DataResult<WeatherDataModel>> getWeatherData();
  Future<DataResult<WeatherDataModel>> search(String city);
}
