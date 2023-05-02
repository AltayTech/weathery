import 'package:weathery/features/feature_weather/domain/entities/current_city_entity.dart';
import 'package:weathery/features/feature_weather/domain/entities/forecast_days_entity.dart';

import '../../../../core/params/forecast_param.dart';
import '../../../../core/resources/data_state.dart';

abstract class WeatherRepository {
  Future<DataState<CurrentCityEntity>> fetchCurrentWeatherData(String cityName);

  Future<DataState<ForecastDaysEntity>> fetchForecastDaysData(
      ForecastParams param);
}
