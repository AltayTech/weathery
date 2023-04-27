import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
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
}
