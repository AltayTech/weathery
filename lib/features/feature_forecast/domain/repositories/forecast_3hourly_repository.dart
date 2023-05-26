import 'package:weathery/features/feature_forecast/domain/entities/forecast_3hourly_entity.dart';

import '../../../../core/params/forecast_param.dart';
import '../../../../core/resources/data_state.dart';

abstract class Forecast3HourlyRepository {
  Future<DataState<Forecast3HourlyEntity>> fetchForecast3hourlyWeather(
      ForecastParams params);
}
