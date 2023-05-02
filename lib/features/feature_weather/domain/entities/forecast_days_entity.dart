import 'package:equatable/equatable.dart';

import '../../data/models/forecast_day_model.dart';

class ForecastDaysEntity extends Equatable {
  final num? lat;
  final num? lon;
  final String? timezone;
  final num? timezoneOffset;
  final Current? current;
  final List<Daily>? daily;
  final List<Alerts>? alerts;

  const ForecastDaysEntity({
    this.lat,
    this.lon,
    this.timezone,
    this.timezoneOffset,
    this.current,
    this.daily,
    this.alerts,
  });

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
