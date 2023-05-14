import 'package:weathery/core/params/forecast_param.dart';
import 'package:weathery/core/resources/data_state.dart';
import 'package:weathery/core/usecase/usecase.dart';
import 'package:weathery/features/feature_forecast/domain/entities/forecast_16_weather_entity.dart';
import 'package:weathery/features/feature_forecast/domain/repositories/forecast_16_repository.dart';

class GetForecast16WeatherUseCase
    extends UseCase<DataState<Forecast16WeatherEntity>, ForecastParams> {
  final Forecast16Repository forecast16repository;

  GetForecast16WeatherUseCase(this.forecast16repository);

  @override
  Future<DataState<Forecast16WeatherEntity>> call(ForecastParams param) {
    return forecast16repository.fetchForecast16Weather(param);
  }
}
