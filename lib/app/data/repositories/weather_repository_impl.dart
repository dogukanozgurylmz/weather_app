import 'package:weather_app/app/core/result/error_model.dart';
import 'package:weather_app/app/core/result/result.dart';
import 'package:weather_app/app/data/models/weather_data_model.dart';
import 'package:weather_app/app/domain/datasources/remote/weather_remote_datasource.dart';
import 'package:weather_app/app/domain/repositories/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherRemoteDatasource _remoteDatasource;

  WeatherRepositoryImpl({
    required WeatherRemoteDatasource remoteDatasource,
  }) : _remoteDatasource = remoteDatasource;

  @override
  Future<DataResult<WeatherDataModel>> getWeatherData() async {
    try {
      var weatherDataModel = await _remoteDatasource.getWeatherData();
      if (weatherDataModel == null) {
        return ErrorDataResult(
            message: ErrorModel(error: "Not 200", title: "Not 200"));
      }
      return SuccessDataResult(data: weatherDataModel);
    } catch (e) {
      return ErrorDataResult(
        message:
            ErrorModel(error: "$runtimeType getWeatherData $e", title: "$e"),
      );
    }
  }

  @override
  Future<DataResult<WeatherDataModel>> search(String city) async {
    try {
      var weatherDataModel = await _remoteDatasource.search(city);
      if (weatherDataModel == null) {
        return ErrorDataResult(
            message: ErrorModel(error: "Not 200", title: "Not 200"));
      }
      return SuccessDataResult(data: weatherDataModel);
    } catch (e) {
      return ErrorDataResult(
        message: ErrorModel(error: "$runtimeType search $e", title: "$e"),
      );
    }
  }
}
