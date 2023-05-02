import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:weathery/core/params/forecast_param.dart';
import 'package:weathery/core/utils/constants.dart';

class ApiProvider {
  final Dio _dio = Dio();

  var apiKey = Constants.apiKey1;

  /// Return current weather from api based on cityName
  Future<dynamic> callCurrentWeather(cityName) async {
    var response = await _dio.get('${Constants.basicURL}/data/2.5/weather',
        queryParameters: {'appid': apiKey, 'q': cityName, 'units': 'metric'});
    debugPrint(response.toString());

    return response;
  }

  /// return forecast weather of next 7 days
  Future<dynamic> sendRequest7DaysForecast(ForeCastParam param) async {
    var response = await _dio.get(
      '${Constants.basicURL}/data/2.5/onecall',
      queryParameters: {
        'lat': param.lat,
        'lon': param.lon,
        'exclude': 'minutely,hourly',
        'appid': apiKey,
        'units': 'metric',
      },
    );
    debugPrint(response.toString());

    return response;
  }
}
