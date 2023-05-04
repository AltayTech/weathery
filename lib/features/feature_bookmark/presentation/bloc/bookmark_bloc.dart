
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:weathery/features/feature_bookmark/domain/use_case/get_city_usecase.dart';
import 'package:weathery/features/feature_bookmark/domain/use_case/save_city_usecase.dart';
import 'package:weathery/features/feature_bookmark/presentation/bloc/get_city_status.dart';
import 'package:weathery/features/feature_bookmark/presentation/bloc/save_city_status.dart';

import '../../../../core/resources/data_state.dart';

part 'bookmark_event.dart';

part 'bookmark_state.dart';

class BookmarkBloc extends Bloc<BookmarkEvent, BookmarkStat> {
  GetCityUseCase getCityUseCase;
  SaveCityUseCase saveCityUseCase;

  BookmarkBloc(this.getCityUseCase, this.saveCityUseCase)
      : super(BookmarkStat(
            getCityStatus: GetCityLoading(),
            saveCityStatus: SaveCityInitial())) {
    /// get city by name event
    on<GetCityByNameEvent>((event, emit) async {
      emit(state.copyWith(newCityStatus: GetCityLoading()));

      DataState dataState = await getCityUseCase(event.cityName);

      if (dataState is DataSuccess) {
        emit((state.copyWith(newCityStatus: GetCityCompleted(dataState.data))));
      }

      if (dataState is DataFailed) {
        emit((state.copyWith(newCityStatus: GetCityError(dataState.data))));
      }
    });

    /// save city in database event
    on<SaveCityByNameEvent>((event, emit) async {
      emit(state.copyWith(newSaveCityStatus: SaveCityLoading()));

      DataState dataState = await saveCityUseCase(event.cityName);

      if (dataState is DataSuccess) {
        emit((state.copyWith(
            newSaveCityStatus: SaveCityCompleted(dataState.data))));
      }

      if (dataState is DataFailed) {
        emit(
            (state.copyWith(newSaveCityStatus: SaveCityError(dataState.data))));
      }
    });

    ///set save city to initial
    on<SaveCityInitialEvent>((event, emit) async {
      emit(state.copyWith(newSaveCityStatus: SaveCityInitial()));
    });
  }
}
