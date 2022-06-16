import 'package:flutter/cupertino.dart';
import 'package:weather/weather/model/weather.dart';
import 'package:weather/weather/service/weather_service.dart';

class WeatherProvider extends ChangeNotifier {
  final IWeatherService weatherService;

  WeatherModel? weather;
  bool isLoading = false;
  void _changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  WeatherProvider(this.weatherService) {
    _fetch();
  }

  Future<void> _fetch() async {
    _changeLoading();
    weather = await weatherService.fetchData();

    _changeLoading();
  }
}
