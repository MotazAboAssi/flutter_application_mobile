import 'package:project/types/weather_type.dart';

class StreamOfState {}

class WeatherInitial extends StreamOfState {
  final WeatherType? weatherType = null;
}

class Weatherloading extends StreamOfState {}

class WeatherSuccess extends StreamOfState {
  final WeatherType weatherType;

  WeatherSuccess({required this.weatherType});
}

class WeatherFailed extends StreamOfState {
  final String message;

  WeatherFailed({required this.message});
}
