import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:weathery/features/feature_forecast/domain/entities/forecast_16_weather_entity.dart';

@immutable
abstract class F16DaysState extends Equatable {}

class F16DaysLoading extends F16DaysState {
  @override
  List<Object?> get props => [];
}

class F16DaysCompleted extends F16DaysState {
  final Forecast16WeatherEntity forecast16weatherEntity;

  F16DaysCompleted(this.forecast16weatherEntity);

  @override
  List<Object?> get props => [forecast16weatherEntity];
}

class F16DaysError extends F16DaysState {
  final String errorMessage;

  F16DaysError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
