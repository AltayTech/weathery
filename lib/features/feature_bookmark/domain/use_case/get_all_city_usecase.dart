import '../../../../core/params/no_param.dart';
import '../../../../core/resources/data_state.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/city_entity.dart';
import '../repositories/city_repository.dart';

class GetAllCityUseCase implements UseCase<DataState<List<City>>, NoParams> {
  final CityRepository _cityRepository;

  GetAllCityUseCase(this._cityRepository);

  @override
  Future<DataState<List<City>>> call(NoParams params) {
    return _cityRepository.getAllCity();
  }
}
