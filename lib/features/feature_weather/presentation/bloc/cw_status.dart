import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:weathery/features/feature_weather/domain/entities/current_city_entity.dart';

@immutable
abstract class CwStatus extends Equatable {
  get currentCityEntity => null;
}

class CwLoading extends CwStatus {
  @override
  List<Object?> get props => [];
}

class CwCompleted extends CwStatus {
  final CurrentCityEntity currentCityEntity;

  CwCompleted(this.currentCityEntity);

  @override
  List<Object?> get props => [currentCityEntity];
}

class CwError extends CwStatus {
  final String errorMessage;

  CwError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
