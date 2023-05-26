import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:weathery/core/params/forecast_param.dart';
import 'package:weathery/core/resources/data_state.dart';
import 'package:weathery/features/feature_forecast/data/models/forecast_3hourly_model.dart';
import 'package:weathery/features/feature_forecast/domain/entities/forecast_3hourly_entity.dart';
import 'package:weathery/features/feature_forecast/domain/repositories/forecast_3hourly_repository.dart';

import '../data_resource/remote/ff_api_provider.dart';

class Forecast3HourlyRepositoryImpl extends Forecast3HourlyRepository {
  FfApiProvider ffApiProvider;

  Forecast3HourlyRepositoryImpl(this.ffApiProvider);

  @override
  Future<DataState<Forecast3HourlyEntity>> fetchForecast3hourlyWeather(
      ForecastParams params) async {
    try {
      Response response = await ffApiProvider.callForecast3HourlyDays(params);
      debugPrint('response.toString()');
      debugPrint(response.toString());

      if (response.statusCode == 200) {
        Forecast3HourlyEntity forecast3hourlyEntity =
            Forecast3hourlyModel.fromJson(response.data);
        debugPrint('currentCityEntity.toString()');
        // debugPrint(currentCityEntity.coord.toString());

        return DataSuccess(forecast3hourlyEntity);
      } else {
        return DataFailed('Something went wrong...');
      }
    } catch (e) {
      debugPrint('e.toString()');
      debugPrint(e.toString());

      return DataFailed(e.toString());
    }
  }
}
