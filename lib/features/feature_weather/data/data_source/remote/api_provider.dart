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
  Future<dynamic> sendRequest7DaysForecast(ForecastParams param) async {
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

  /// city name suggest api
  Future<dynamic> sendRequestCitySuggestion(String prefix) async {
    var response = await _dio.get(
        "http://geodb-free-service.wirefreethought.com/v1/geo/cities",
        queryParameters: {'limit': 7, 'offset': 0, 'namePrefix': prefix});

    return response;
  }
}
