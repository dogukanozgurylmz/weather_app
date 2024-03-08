import 'dart:convert';

class WeatherModel {
  String? date;
  String? day;
  String? icon;
  String? description;
  String? status;
  String? degree;
  String? min;
  String? max;
  String? night;
  String? humidity;

  WeatherModel({
    this.date,
    this.day,
    this.icon,
    this.description,
    this.status,
    this.degree,
    this.min,
    this.max,
    this.night,
    this.humidity,
  });

  factory WeatherModel.fromMap(Map<String, dynamic> map) {
    return WeatherModel(
      date: map['date'] != null ? map['date'] as String : null,
      day: map['day'] != null ? map['day'] as String : null,
      icon: map['icon'] != null ? map['icon'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      status: map['status'] != null ? map['status'] as String : null,
      degree: map['degree'] != null ? map['degree'] as String : null,
      min: map['min'] != null ? map['min'] as String : null,
      max: map['max'] != null ? map['max'] as String : null,
      night: map['night'] != null ? map['night'] as String : null,
      humidity: map['humidity'] != null ? map['humidity'] as String : null,
    );
  }

  factory WeatherModel.fromJson(String source) =>
      WeatherModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
