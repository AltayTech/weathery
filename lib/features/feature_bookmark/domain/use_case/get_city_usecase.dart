import '../../../../core/resources/data_state.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/city_entity.dart';
import '../repositories/city_repository.dart';

class GetCityUseCase implements UseCase<DataState<City?>, String> {
  final CityRepository _cityRepository;

  GetCityUseCase(this._cityRepository);

  @override
  Future<DataState<City?>> call(String params) {
    return _cityRepository.getCityByName(params);
  }
}
