import '../../../../core/resources/data_state.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/city_entity.dart';
import '../repositories/city_repository.dart';

class SaveCityUseCase implements UseCase<DataState<City>, String> {
  final CityRepository _cityRepository;

  SaveCityUseCase(this._cityRepository);

  @override
  Future<DataState<City>> call(String params) {
    return _cityRepository.saveCityToDB(params);
  }
}
