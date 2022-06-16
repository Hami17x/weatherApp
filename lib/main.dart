import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/global/theme.dart/theme_provider.dart';
import 'package:weather/weather/view/weather_view.dart';

void main() {
  runApp(MultiProvider(
    builder: (context, child) => const MyApp(),
    providers: [
      ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
      )
    ],
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: context.watch<ThemeProvider>().currentTheme,
        home: const WeatherView());
  }
}
