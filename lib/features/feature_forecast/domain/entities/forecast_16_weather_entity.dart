import 'package:equatable/equatable.dart';

import '../../data/models/forecast_16_weather_model.dart';

class Forecast16WeatherEntity extends Equatable {
  final City? city;
  final String? cod;
  final num? message;
  final num? cnt;
  final List<dayList>? list;

  Forecast16WeatherEntity({
    this.city,
    this.cod,
    this.message,
    this.cnt,
    this.list,
  });

  @override
  List<Object?> get props => [
    city,
    cod,
    message,
    cnt,
    list,
  ];
}
