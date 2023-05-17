import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:weathery/core/params/forecast_param.dart';
import 'package:weathery/core/resources/data_state.dart';
import 'package:weathery/features/feature_forecast/domain/use_cases/get_forecast_3hourly_usecase.dart';
import 'package:weathery/features/feature_forecast/presentation/bloc/f_3hourly_status.dart';

part 'forecast_event.dart';
part 'forecast_state.dart';

class ForecastBloc extends Bloc<ForecastEvent, ForecastState> {
  final GetForecast3HourlyUsecase getForecast3HourlyUsecase;

  ForecastBloc(this.getForecast3HourlyUsecase)
      : super(ForecastState(f3hourlyState: F3HourlyLoading())) {
    on<LoadF3HourlyEvent>((event, emit) async {
      emit(state.copyWith(newF3hourlyState: F3HourlyLoading()));

      DataState dataState =
          await getForecast3HourlyUsecase(event.forecastParams);

      if (dataState is DataSuccess) {
        emit(state.copyWith(
            newF3hourlyState: F3HourlyCompleted(dataState.data)));
      } else if (dataState is DataFailed) {
        emit(state.copyWith(newF3hourlyState: F3HourlyError(dataState.error!)));
      }
    });
  }
}
