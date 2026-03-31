import 'package:flutter/material.dart';

LinearGradient colorByCode(int code) {
  final Color sunny = const Color.fromARGB(255, 255, 184, 92);
  final Color cloudy = Colors.grey;
  final Color rain = Colors.lightBlueAccent;
  return switch (code) {
    0 => LinearGradient(
      begin: AlignmentGeometry.topCenter,
      end: AlignmentGeometry.bottomCenter,
      colors: [Colors.white, Colors.white],
    ),
    1000 => LinearGradient(
      begin: AlignmentGeometry.topCenter,
      end: AlignmentGeometry.bottomCenter,
      colors: [for (int i = 1; i <= 5; i++) sunny, Colors.white],
    ),

    1063 ||
    1180 ||
    1183 ||
    1186 ||
    1189 ||
    1192 ||
    1195 ||
    1198 ||
    1201 ||
    1240 ||
    1243 ||
    1246 ||
    1273 ||
    1276 => LinearGradient(
      begin: AlignmentGeometry.topCenter,
      end: AlignmentGeometry.bottomCenter,
      colors: [for (int i = 1; i <= 5; i++) rain, Colors.white],
    ),

    int() => LinearGradient(
      begin: AlignmentGeometry.topCenter,
      end: AlignmentGeometry.bottomCenter,
      colors: [for (int i = 1; i <= 5; i++) cloudy, Colors.white],
    ),
  };
}
