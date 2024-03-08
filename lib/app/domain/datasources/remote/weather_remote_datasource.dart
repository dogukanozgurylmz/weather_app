import 'package:weather_app/app/data/models/weather_data_model.dart';

abstract class WeatherRemoteDatasource {
  Future<WeatherDataModel?> getWeatherData();
  Future<WeatherDataModel?> search(String city);
}
