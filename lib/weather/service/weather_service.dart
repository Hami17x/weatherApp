import 'dart:io';

import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather/model/weather.dart';
import 'package:weather/weather/service/location_service.dart';

abstract class IWeatherService {
  final Dio dio;

  IWeatherService(this.dio);

  Future<WeatherModel?> fetchData();
}

class WeatherService extends IWeatherService {
  WeatherService(Dio dio) : super(dio);

  @override
  Future<WeatherModel?> fetchData() async {
    Position currentPosition = await LocationService.determinePosition();
    print(currentPosition);
    final response = await dio.get(
        "lat=${currentPosition.latitude.toInt()}&lon=${currentPosition.longitude.toInt()}&appid=31f2a4ed388b87d7a99f011b2f5d0ad1&units=metric&lang=en");

    if (response.statusCode == HttpStatus.ok) {
      final jsonbody = response.data;
      if (jsonbody is Map<String, dynamic>) {
        return WeatherModel.fromJson(jsonbody);
      }
    }
    return null;
  }
}
