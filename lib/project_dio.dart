import 'package:dio/dio.dart';

class ProjectDioMixin {
  final service = Dio(
      BaseOptions(baseUrl: "https://api.openweathermap.org/data/2.5/weather?"));
}
