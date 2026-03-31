import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/bloc/weather_bloc.dart';
import 'package:project/services/http_requist.dart';
import 'package:project/views/home_view.dart';

void main() {
  runApp(
    BlocProvider(
      lazy: false,
      create: (BuildContext context) => WeatherBloc(HttpRequist(dio: Dio())),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomeView(),
      theme: ThemeData(appBarTheme: AppBarTheme(elevation: 10)),
    );
  }
}
