import 'package:weather_app/app/data/models/weather_data_model.dart';
import 'package:weather_app/app/domain/datasources/remote/weather_remote_datasource.dart';
import 'package:http/http.dart' as http;

class WeatherRemoteDatasourceImpl implements WeatherRemoteDatasource {
  final _baseUrl = "https://api.collectapi.com/weather/getWeather";
  final _headers = {
    'authorization': 'apikey 5odnqkUrdVDgsnmAL1PvBC:4SUcQkz2a3K6konZJuirfS',
    'content-type': 'application/json'
  };
  @override
  Future<WeatherDataModel?> getWeatherData() async {
    var url = Uri.parse('$_baseUrl?data.lang=tr&data.city=istanbul');
    var response = await http.get(url, headers: _headers);
    if (response.statusCode == 200) {
      return WeatherDataModel.fromJson(response.body);
    } else {
      return null;
    }
  }

  @override
  Future<WeatherDataModel?> search(String city) async {
    var url = Uri.parse('$_baseUrl?data.lang=tr&data.city=$city');
    var response = await http.get(url, headers: _headers);
    if (response.statusCode == 200) {
      return WeatherDataModel.fromJson(response.body);
    } else {
      return null;
    }
  }
}
