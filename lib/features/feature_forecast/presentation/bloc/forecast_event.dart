part of 'forecast_bloc.dart';

@immutable
abstract class ForecastEvent {}

class LoadF16DaysEvent extends ForecastEvent {
  final ForecastParams forecastParams;

  LoadF16DaysEvent(this.forecastParams);
}
