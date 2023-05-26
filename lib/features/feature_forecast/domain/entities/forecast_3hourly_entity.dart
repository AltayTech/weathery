import 'package:equatable/equatable.dart';

import '../../data/models/forecast_3hourly_model.dart';

class Forecast3HourlyEntity extends Equatable {
  final String? cod;
  final num? message;
  final num? cnt;
  final List<Time3H>? list;
  final City? city;

  Forecast3HourlyEntity({
    this.cod,
    this.message,
    this.cnt,
    this.list,
    this.city,
  });

  @override
  List<Object?> get props => [
        cod,
        message,
        cnt,
        list,
        city,
      ];
}
