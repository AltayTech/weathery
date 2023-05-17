part of 'forecast_bloc.dart';

class ForecastState extends Equatable {
  F3HourlyState f3hourlyState;

  ForecastState({
    required this.f3hourlyState,
  });

  ForecastState copyWith({
    F3HourlyState? newF3hourlyState,
  }) {
    return ForecastState(
      f3hourlyState: newF3hourlyState ?? this.f3hourlyState,
    );
  }

  @override
  List<Object?> get props => [f3hourlyState];
}
