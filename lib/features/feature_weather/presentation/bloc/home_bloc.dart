import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:weathery/core/params/forecast_param.dart';
import 'package:weathery/features/feature_weather/domain/use_case/get_current_weather_usecase.dart';
import 'package:weathery/features/feature_weather/domain/use_case/get_forecast_weather_usecase.dart';
import 'package:weathery/features/feature_weather/presentation/bloc/cw_status.dart';
import 'package:weathery/features/feature_weather/presentation/bloc/fw_status.dart';

import '../../../../core/resources/data_state.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetCurrentWeatherUseCase getCurrentWeatherUseCase;
  final GetForecastWeatherUseCase getForecastWeatherUseCase;

  HomeBloc(this.getCurrentWeatherUseCase, this.getForecastWeatherUseCase)
      : super(HomeState(cwStatus: CwLoading(), fwStatus: FwLoading())) {
    on<LoadCwEvent>((event, emit) async {
      emit(state.copyWith(newCwStatus: CwLoading()));

      DataState dataState = await getCurrentWeatherUseCase(event.cityName);

      if (dataState is DataSuccess) {
        emit(state.copyWith(newCwStatus: CwCompleted(dataState.data)));
      } else if (dataState is DataFailed) {
        emit(state.copyWith(newCwStatus: CwError(dataState.error!)));
      }
    });

    on<LoadFwEvent>((event, emit) async {
      emit(state.copyWith(newFwStatus: FwLoading()));

      DataState dataState =
          await getForecastWeatherUseCase(event.foreCastParam);

      if (dataState is DataSuccess) {
        emit(state.copyWith(newFwStatus: FwCompleted(dataState.data)));
      } else if (dataState is DataFailed) {
        emit(state.copyWith(newFwStatus: FwError(dataState.error!)));
      }
    });
  }
}
