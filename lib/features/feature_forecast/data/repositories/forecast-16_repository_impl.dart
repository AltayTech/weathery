import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:weathery/core/params/forecast_param.dart';
import 'package:weathery/core/resources/data_state.dart';
import 'package:weathery/features/feature_forecast/data/data_resource/remote/api_provider.dart';
import 'package:weathery/features/feature_forecast/data/models/forecast_16_weather_model.dart';
import 'package:weathery/features/feature_forecast/domain/entities/forecast_16_weather_entity.dart';
import 'package:weathery/features/feature_forecast/domain/repositories/forecast_16_repository.dart';

class Forecast16RepositoryImpl extends Forecast16Repository {
  late ApiProvider apiProvider;

  @override
  Future<DataState<Forecast16WeatherEntity>> fetchForecast16Weather(
      ForecastParams params) async {
    try {
      Response response = await apiProvider.callForecast16Days(params);

      if (response.statusCode == 200) {
        Forecast16WeatherEntity forecast16weatherEntity =
            Forecast16WeatherModel.fromJson(response.data);
        debugPrint('currentCityEntity.toString()');
        // debugPrint(currentCityEntity.coord.toString());

        return DataSuccess(forecast16weatherEntity);
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
