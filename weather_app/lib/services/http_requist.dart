
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:project/config/api.dart';
import 'package:project/types/weather_type.dart';

class HttpRequist {
  final Dio dio;

  HttpRequist({required this.dio});
  Future<WeatherType> getByCity({required String city}) async {
    try {
      final response = await dio.get("$api&q=$city");
      final json = response.data;
      return WeatherType.fromJSON(json as Map<String, dynamic>);
    } on DioException catch (e) {
      final String errorMessage =
          e.response?.data["error"]["message"] ??
          "Either no connect internet or active proxy.\ntry again later!";
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception(
        "Either no connect internet or active proxy.\ntry again later!",
      );
    }
  }
}

