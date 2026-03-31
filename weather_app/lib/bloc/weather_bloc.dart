import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/bloc/weather_event.dart';
import 'package:project/bloc/weather_state.dart';
import 'package:project/services/http_requist.dart';
import 'package:project/types/weather_type.dart';

class WeatherBloc extends Bloc<ChangeWeatherEvent, StreamOfState> {
  final HttpRequist httpRequist;
  WeatherBloc(this.httpRequist) : super(WeatherInitial()) {
    on<ChangeWeatherEvent>((event, emit) async {
      emit(Weatherloading());
      try {
        final WeatherType data = await httpRequist.getByCity(city: event.city);
        emit(WeatherSuccess(weatherType: data));
      } catch (error) {
        emit(WeatherFailed(message: error.toString()));
      }
    });
  }
}
