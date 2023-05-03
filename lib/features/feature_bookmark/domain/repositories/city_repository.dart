import 'package:weathery/core/resources/data_state.dart';
import 'package:weathery/features/feature_bookmark/domain/entities/city_entity.dart';

abstract class CityRepository {
  Future<DataState<City>> saveCityToDB(String name);

  Future<DataState<List<City>>> getAllCity();

  Future<DataState<City?>> getCityByName(String cityName);

  Future<DataState<String>> deleteCityByName(String cityName);
}
