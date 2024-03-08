// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:weather_app/app/data/models/weather_model.dart';

class WeatherDataModel {
  bool? success;
  List<WeatherModel>? result;

  WeatherDataModel({
    required this.success,
    required this.result,
  });

  factory WeatherDataModel.fromMap(Map<String, dynamic> map) {
    return WeatherDataModel(
      success: map['success'] != null ? map['success'] as bool : null,
      result: map['result'] != null
          ? List<WeatherModel>.from(
              (map['result'] as List<dynamic>).map<WeatherModel?>(
                (x) => WeatherModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  factory WeatherDataModel.fromJson(String source) =>
      WeatherDataModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
