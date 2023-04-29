import 'package:weathery/core/usecase/usecase.dart';
import 'package:weathery/features/feature_weather/domain/entities/current_city_entity.dart';
import 'package:weathery/features/feature_weather/domain/repositories/weather_repository.dart';

import '../../../../core/resources/data_state.dart';

class GetCurrentWeatherUseCase
    extends UseCase<DataState<CurrentCityEntity>, String> {
  late final WeatherRepository weatherRepository;

  GetCurrentWeatherUseCase(this.weatherRepository);

  @override
  Future<DataState<CurrentCityEntity>> call(String param) {
    return weatherRepository.fetchCurrentWeatherData(param);
  }
}
