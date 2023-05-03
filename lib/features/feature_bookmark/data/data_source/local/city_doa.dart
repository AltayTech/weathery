

import 'package:floor/floor.dart';
import 'package:weathery/features/feature_bookmark/domain/entities/city_entity.dart';

@dao
abstract class CityDao{
  @Query('SELECT * FROM city')
  Future<List<City>> findAllCity();

  @Query('SELECT * FROM city WHERE name= :name')
  Future<List<String>> findCityByName(String name);

  @Query('DELETE FROM city WHERE name= :name')
  Future<List<String>> deleteCityByName(String name);

  @insert
  Future<void> insertCity(City city);

}