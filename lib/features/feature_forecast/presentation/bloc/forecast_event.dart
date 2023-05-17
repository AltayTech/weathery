part of 'forecast_bloc.dart';

@immutable
abstract class ForecastEvent {}

class LoadF3HourlyEvent extends ForecastEvent {
  final ForecastParams forecastParams;

  LoadF3HourlyEvent(this.forecastParams);
}
