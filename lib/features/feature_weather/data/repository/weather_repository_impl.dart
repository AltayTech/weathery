import 'package:dio/dio.dart';
import 'package:weathery/core/resources/data_state.dart';
import 'package:weathery/features/feature_weather/data/data_source/remote/api_provider.dart';
import 'package:weathery/features/feature_weather/data/models/CurrentCityModel.dart';
import 'package:weathery/features/feature_weather/domain/entities/current_city_entity.dart';
import 'package:weathery/features/feature_weather/domain/repositories/weather_repository.dart';

class WeatherRepsitoryImpl extends WeatherRepository {
  late ApiProvider apiProvider;

  WeatherRepsitoryImpl(this.apiProvider);

  @override
  Future<DataState<CurrentCityEntity>> fetchCurrentWeatherData(
      String cityName) async {
    try {
      Response response = await apiProvider.callCurrentWeather(cityName);
      if (response.statusCode == 200) {
        CurrentCityEntity currentCityEntity =
            CurrentCityModel.fromJson(response);
        return DataSuccess(currentCityEntity);
      } else {
        return DataFiald('Something went wrong...');
      }
    } catch (e) {
      return DataFiald(e.toString());
    }
  }
}
