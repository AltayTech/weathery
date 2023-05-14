import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:weathery/core/params/forecast_param.dart';
import 'package:weathery/core/resources/data_state.dart';
import 'package:weathery/features/feature_forecast/presentation/bloc/f_16days_status.dart';

import '../../domain/use_cases/get_forecast_16_weather_usecase.dart';

part 'forecast_event.dart';

part 'forecast_state.dart';

class ForecastBloc extends Bloc<ForecastEvent, ForecastState> {
  final GetForecast16WeatherUseCase getForecast16WeatherUseCase;

  ForecastBloc(this.getForecast16WeatherUseCase)
      : super(ForecastState(f16daysState: F16DaysLoading())) {
    on<LoadF16DaysEvent>((event, emit) async {
      emit(state.copyWith(newF16daysState: F16DaysLoading()));

      DataState dataState =
          await getForecast16WeatherUseCase(event.forecastParams);

      if (dataState is DataSuccess) {
        emit(state.copyWith(newF16daysState: F16DaysCompleted(dataState.data)));
      } else if (dataState is DataFailed) {
        emit(state.copyWith(newF16daysState: F16DaysError(dataState.error!)));
      }
    });
  }
}
