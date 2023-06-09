import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:weathery/core/params/forecast_param.dart';
import 'package:weathery/core/resources/data_state.dart';
import 'package:weathery/features/feature_weather/data/data_source/remote/fw_api_provider.dart';
import 'package:weathery/features/feature_weather/data/models/current_city_model.dart';
import 'package:weathery/features/feature_weather/data/models/forecast_day_model.dart';
import 'package:weathery/features/feature_weather/data/models/suggested_%20city_model.dart';
import 'package:weathery/features/feature_weather/domain/entities/current_city_entity.dart';
import 'package:weathery/features/feature_weather/domain/entities/forecast_days_entity.dart';
import 'package:weathery/features/feature_weather/domain/entities/suggest_city_entity.dart';
import 'package:weathery/features/feature_weather/domain/repositories/weather_repository.dart';

class WeatherRepositoryImpl extends WeatherRepository {
  late FwApiProvider apiProvider;

  WeatherRepositoryImpl(this.apiProvider);

  @override
  Future<DataState<CurrentCityEntity>> fetchCurrentWeatherData(
      String cityName) async {
    try {
      Response response = await apiProvider.callCurrentWeather(cityName);
      debugPrint('response.toString()');
      debugPrint(response.toString());
      debugPrint(response.data.toString());

      if (response.statusCode == 200) {
        CurrentCityEntity currentCityEntity =
            CurrentCityModel.fromJson(response.data);
        debugPrint('currentCityEntity.toString()');
        // debugPrint(currentCityEntity.coord.toString());

        return DataSuccess(currentCityEntity);
      } else {
        return DataFailed('Something went wrong...');
      }
    } catch (e) {
      debugPrint('e.toString()');
      debugPrint(e.toString());

      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState<ForecastDaysEntity>> fetchForecastDaysData(
      ForecastParams param) async {
    try {
      Response response = await apiProvider.sendRequest7DaysForecast(param);
      debugPrint('response.toString()');
      debugPrint(response.toString());
      debugPrint(response.data.toString());

      if (response.statusCode == 200) {
        ForecastDaysEntity forecastDaysEntity =
            ForecastDayModel.fromJson(response.data);
        debugPrint('currentCityEntity.toString()');
        // debugPrint(currentCityEntity.coord.toString());

        return DataSuccess(forecastDaysEntity);
      } else {
        return DataFailed('Something went wrong...');
      }
    } catch (e) {
      debugPrint('e.toString()');
      debugPrint(e.toString());

      return DataFailed(e.toString());
    }
  }

  @override
  Future<List<Data>> fetchSuggestCityData(String prefix) async {
    try {
      Response response = await apiProvider.sendRequestCitySuggestion(prefix);
      debugPrint('response.toString()');
      debugPrint(response.toString());
      debugPrint(response.data.toString());

      if (response.statusCode == 200) {
        SuggestCityEntity suggestCityEntity =
            SuggestCityModel.fromJson(response.data);
        debugPrint('currentCityEntity.toString()');
        // debugPrint(currentCityEntity.coord.toString());

        return suggestCityEntity.data!;
      } else {
        return [];
      }
    } catch (e) {
      debugPrint('e.toString()');
      debugPrint(e.toString());

      return [];
    }
  }
}
