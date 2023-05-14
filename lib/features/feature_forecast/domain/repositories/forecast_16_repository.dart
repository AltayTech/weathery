import 'package:weathery/core/params/forecast_param.dart';
import 'package:weathery/features/feature_forecast/domain/entities/forecast_16_weather_entity.dart';

import '../../../../core/resources/data_state.dart';

abstract class Forecast16Repository {
  Future<DataState<Forecast16WeatherEntity>> fetchForecast16Weather(
      ForecastParams params);
}
