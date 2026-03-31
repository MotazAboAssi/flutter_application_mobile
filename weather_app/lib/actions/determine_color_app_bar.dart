import 'package:flutter/material.dart';
import 'package:project/theme/theme.dart';
import 'package:project/types/weather_type.dart';

Color determineColorAppBar(WeatherType? data) {
  return data == null ? Colors.blue : colorByCode(data.codeImage).colors[0];
}
