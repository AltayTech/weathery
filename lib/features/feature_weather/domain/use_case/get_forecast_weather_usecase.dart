import 'package:weathery/core/params/forecast_param.dart';
import 'package:weathery/core/resources/data_state.dart';
import 'package:weathery/core/usecase/usecase.dart';
import 'package:weathery/features/feature_weather/domain/entities/forecast_days_entity.dart';
import 'package:weathery/features/feature_weather/domain/repositories/weather_repository.dart';

class GetForecastWeatherUseCase
    extends UseCase<DataState<ForecastDaysEntity>, ForecastParams> {
  final WeatherRepository weatherRepository;

  GetForecastWeatherUseCase(this.weatherRepository);

  @override
  Future<DataState<ForecastDaysEntity>> call(ForecastParams param) {
    return weatherRepository.fetchForecastDaysData(param);
  }
}
