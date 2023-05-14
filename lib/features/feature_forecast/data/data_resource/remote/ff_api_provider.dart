import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weathery/core/params/forecast_param.dart';
import 'package:weathery/core/utils/constants.dart';

class FfApiProvider {
  final Dio _dio = Dio();

  String apiKey = Constants.apiKey1;

  /// return forecast of next 16 days from api
  Future<dynamic> callForecast16Days(ForecastParams params) async {
    var response = await _dio
        .get('${Constants.basicURL}/data/2.5/forecast/daily', queryParameters: {
      'lat': params.lat,
      'lon': params.lon,
      'exclude': 'minutely,hourly',
      'appid': apiKey,
      'units': 'metric',
    });

    debugPrint(response.toString());
    return response;
  }
}
