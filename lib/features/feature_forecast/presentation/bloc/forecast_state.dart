part of 'forecast_bloc.dart';

class ForecastState extends Equatable {

  F16DaysState f16daysState;


  ForecastState({required this.f16daysState,});


  ForecastState copyWith({
    F16DaysState? newF16daysState,
  }) {
    return ForecastState(f16daysState: newF16daysState ?? this.f16daysState,);
  }

  @override
  List<Object?> get props => [f16daysState];


}

