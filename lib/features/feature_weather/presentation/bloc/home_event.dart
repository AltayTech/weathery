part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class LoadCwEvent extends HomeEvent {
  late final String cityName;

  LoadCwEvent(this.cityName);
}
