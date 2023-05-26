import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weathery/core/params/forecast_param.dart';
import 'package:weathery/core/utils/constants.dart';

class FfApiProvider {
  final Dio _dio = Dio();

  String apiKey = Constants.apiKey1;

  /// return forecast 3 hourly of next 5 days from api
  Future<dynamic> callForecast3HourlyDays(ForecastParams params) async {
    debugPrint('${Constants.basicURL}/data/2.5/forecast');

    var response = await _dio
        .get('${Constants.basicURL}/data/2.5/forecast', queryParameters: {
      'lat': params.lat,
      'lon': params.lon,
      'appid': apiKey,
      'units': 'metric',
    });

    debugPrint(response.headers.toString());
    return response;
  }
}
