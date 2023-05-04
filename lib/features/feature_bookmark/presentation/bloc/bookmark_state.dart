part of 'bookmark_bloc.dart';

class BookmarkStat extends Equatable {
  final GetCityStatus getCityStatus;
  final SaveCityStatus saveCityStatus;

  const BookmarkStat(
      {required this.getCityStatus, required this.saveCityStatus});

  BookmarkStat copyWith({
    GetCityStatus? newCityStatus,
    SaveCityStatus? newSaveCityStatus,
  }) {
    return BookmarkStat(
      getCityStatus: newCityStatus ?? getCityStatus,
      saveCityStatus: newSaveCityStatus ?? saveCityStatus,
    );
  }

  @override
  List<Object?> get props => [
        getCityStatus,
        saveCityStatus,
      ];
}
