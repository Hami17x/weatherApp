import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/global/theme.dart/theme_provider.dart';
import 'package:weather/project_dio.dart';
import 'package:weather/weather/model/weather.dart';
import 'package:weather/weather/service/weather_service.dart';
import 'package:weather/weather/view_model/weather_provider.dart';

class WeatherView extends StatefulWidget {
  const WeatherView({Key? key}) : super(key: key);

  @override
  State<WeatherView> createState() => _WeatherViewState();
}

class _WeatherViewState extends State<WeatherView> with ProjectDioMixin {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WeatherProvider(WeatherService(service)),
      builder: (context, child) {
        return Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                    onPressed: (() {
                      context.read<ThemeProvider>().changeTheme();
                    }),
                    icon: context.watch<ThemeProvider>().isLightTheme
                        ? const Icon(Icons.light_mode)
                        : const Icon(Icons.dark_mode_sharp))
              ],
              title: context.watch<WeatherProvider>().isLoading
                  ? Text("loading...")
                  : Text("Loaded"),
            ),
            body: _weatherColumn(
                context, context.watch<WeatherProvider>().weather));
      },
    );
  }

  Widget _weatherColumn(BuildContext context, WeatherModel? weather) {
    return weather != null
        ? Column(
            children: [
              const SizedBox(height: 50),
              Center(
                child: Text(
                  weather.name ?? "",
                  style: const TextStyle(
                      fontSize: 40, fontWeight: FontWeight.bold),
                ),
              ),
              Image.network(
                "https://openweathermap.org/img/wn/" +
                    weather.weather![0].icon.toString() +
                    "@2x.png",
              ),
              Text(weather.weather![0].description ?? "",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold)),
              Text(weather.weather![0].main ?? "",
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 50,
              ),
              Text("Humidity :" + weather.main!.humidity.toString()),
              Text("Pressure :" + weather.main!.pressure.toString()),
              Text("Wind Speed :" + weather.wind!.speed.toString()),
            ],
          )
        : Center(
            child: CircularProgressIndicator(),
          );
  }
}
