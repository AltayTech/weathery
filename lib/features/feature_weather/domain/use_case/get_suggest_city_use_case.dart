import 'package:weathery/core/usecase/usecase.dart';
import 'package:weathery/features/feature_weather/domain/repositories/weather_repository.dart';

import '../../data/models/suggested_ city_model.dart';

class GetSuggestCityUseCase
    extends UseCase<List<Data>, String> {
  final WeatherRepository weatherRepository;

  GetSuggestCityUseCase(this.weatherRepository);

  @override
  Future<List<Data>> call(String param) {
    return weatherRepository.fetchSuggestCityData(param);
  }
}
