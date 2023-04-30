import 'package:flutter/material.dart';
import 'package:weathery/features/feature_weather/domain/entities/current_city_entity.dart';

@immutable
abstract class CwStatus {}

class CwLoading extends CwStatus {}

class CwCompleted extends CwStatus {
  final CurrentCityEntity currentCityEntity;

  CwCompleted(this.currentCityEntity);
}

class CwError extends CwStatus {
  final String errorMessage;

  CwError(this.errorMessage);
}
