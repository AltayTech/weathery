part of 'bookmark_bloc.dart';

@immutable
abstract class BookmarkEvent {}

class GetAllCityEvent extends BookmarkEvent {}

class GetCityByNameEvent extends BookmarkEvent {
  final String cityName;

  GetCityByNameEvent(this.cityName);
}

class SaveCityByNameEvent extends BookmarkEvent {
  final String cityName;

  SaveCityByNameEvent(this.cityName);
}

class DeleteCityByNameEvent extends BookmarkEvent {
  final String cityName;

  DeleteCityByNameEvent(this.cityName);
}

class SaveCityInitialEvent extends BookmarkEvent {}
