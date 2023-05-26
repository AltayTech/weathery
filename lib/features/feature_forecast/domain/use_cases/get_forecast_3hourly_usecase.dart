import 'package:weathery/core/params/forecast_param.dart';
import 'package:weathery/core/resources/data_state.dart';
import 'package:weathery/core/usecase/usecase.dart';
import 'package:weathery/features/feature_forecast/domain/entities/forecast_3hourly_entity.dart';
import 'package:weathery/features/feature_forecast/domain/repositories/forecast_3hourly_repository.dart';

class GetForecast3HourlyUsecase
    extends UseCase<DataState<Forecast3HourlyEntity>, ForecastParams> {
  final Forecast3HourlyRepository forecast3hourlyRepository;

  GetForecast3HourlyUsecase(this.forecast3hourlyRepository);

  @override
  Future<DataState<Forecast3HourlyEntity>> call(ForecastParams param) {
    return forecast3hourlyRepository.fetchForecast3hourlyWeather(param);
  }
}
