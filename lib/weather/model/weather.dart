import 'package:json_annotation/json_annotation.dart';
part 'weather.g.dart';

@JsonSerializable(createToJson: false)
class WeatherModel {
  List<Weather>? weather;
  String? base;
  Main? main;
  Wind? wind;
  String? name;

  WeatherModel({this.weather, this.base, this.main, this.wind, this.name});

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return _$WeatherModelFromJson(json);
  }
}

@JsonSerializable(createToJson: false)
class Weather {
  int? id;
  String? main;
  String? description;
  String? icon;

  Weather({this.id, this.main, this.description, this.icon});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return _$WeatherFromJson(json);
  }
}

@JsonSerializable(createToJson: false)
class Main {
  double? temp;
  double? feelsLike;
  double? tempMin;
  double? tempMax;
  int? pressure;
  int? humidity;

  Main(
      {this.temp,
      this.feelsLike,
      this.tempMin,
      this.tempMax,
      this.pressure,
      this.humidity});

  factory Main.fromJson(Map<String, dynamic> json) {
    return _$MainFromJson(json);
  }
}

@JsonSerializable(createToJson: false)
class Wind {
  double? speed;
  int? deg;

  Wind({this.speed, this.deg});

  factory Wind.fromJson(Map<String, dynamic> json) {
    return _$WindFromJson(json);
  }
}
