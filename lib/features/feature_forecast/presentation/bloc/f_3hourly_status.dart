import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:weathery/features/feature_forecast/domain/entities/forecast_3hourly_entity.dart';

@immutable
abstract class F3HourlyState extends Equatable {}

class F3HourlyLoading extends F3HourlyState {
  @override
  List<Object?> get props => [];
}

class F3HourlyCompleted extends F3HourlyState {
  final Forecast3HourlyEntity forecast3hourlyEntity;

  F3HourlyCompleted(this.forecast3hourlyEntity);

  @override
  List<Object?> get props => [forecast3hourlyEntity];
}

class F3HourlyError extends F3HourlyState {
  final String errorMessage;

  F3HourlyError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
