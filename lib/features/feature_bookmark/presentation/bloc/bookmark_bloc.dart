import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:weathery/core/params/no_param.dart';
import 'package:weathery/core/resources/data_state.dart';
import 'package:weathery/features/feature_bookmark/domain/use_case/delete_city_usecase.dart';
import 'package:weathery/features/feature_bookmark/domain/use_case/get_all_city_usecase.dart';
import 'package:weathery/features/feature_bookmark/domain/use_case/get_city_usecase.dart';
import 'package:weathery/features/feature_bookmark/domain/use_case/save_city_usecase.dart';
import 'package:weathery/features/feature_bookmark/presentation/bloc/delete_city_status.dart';
import 'package:weathery/features/feature_bookmark/presentation/bloc/get_all_city_status.dart';
import 'package:weathery/features/feature_bookmark/presentation/bloc/get_city_status.dart';
import 'package:weathery/features/feature_bookmark/presentation/bloc/save_city_status.dart';

part 'bookmark_event.dart';

part 'bookmark_state.dart';

class BookmarkBloc extends Bloc<BookmarkEvent, BookmarkState> {
  GetCityUseCase getCityUseCase;
  SaveCityUseCase saveCityUseCase;
  GetAllCityUseCase getAllCityUseCase;
  DeleteCityUseCase deleteCityUseCase;

  BookmarkBloc(
    this.getCityUseCase,
    this.saveCityUseCase,
    this.getAllCityUseCase,
    this.deleteCityUseCase,
  ) : super(BookmarkState(
          getCityStatus: GetCityLoading(),
          saveCityStatus: SaveCityInitial(),
          getAllCityStatus: GetAllCityLoading(),
          deleteCityStatus: DeleteCityInitial(),
        )) {
    /// get city by name event
    on<GetCityByNameEvent>((event, emit) async {
      emit(state.copyWith(newCityStatus: GetCityLoading()));

      DataState dataState = await getCityUseCase(event.cityName);

      if (dataState is DataSuccess) {
        emit(state.copyWith(newCityStatus: GetCityCompleted(dataState.data)));
      }

      if (dataState is DataFailed) {
        emit(state.copyWith(newCityStatus: GetCityError(dataState.error)));
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
        emit((state.copyWith(
            newSaveCityStatus: SaveCityError(dataState.error))));
      }
    });

    ///set save city to initial
    on<SaveCityInitialEvent>((event, emit) async {
      emit(state.copyWith(newSaveCityStatus: SaveCityInitial()));
    });

    /// get All city
    on<GetAllCityEvent>((event, emit) async {
      /// emit Loading state
      emit(state.copyWith(newGetAllCityStatus: GetAllCityLoading()));

      DataState dataState = await getAllCityUseCase(NoParams());

      /// emit Complete state
      if (dataState is DataSuccess) {
        emit(state.copyWith(
            newGetAllCityStatus: GetAllCityCompleted(dataState.data)));
      }

      /// emit Error state
      if (dataState is DataFailed) {
        emit(state.copyWith(
            newGetAllCityStatus: GetAllCityError(dataState.error)));
      }
    });

    /// City Delete Event
    on<DeleteCityByNameEvent>((event, emit) async {
      /// emit Loading state
      emit(state.copyWith(newDeleteCityStatus: DeleteCityLoading()));

      DataState dataState = await deleteCityUseCase(event.cityName);

      /// emit Complete state
      if (dataState is DataSuccess) {
        emit(state.copyWith(
            newDeleteCityStatus: DeleteCityCompleted(dataState.data)));
      }

      /// emit Error state
      if (dataState is DataFailed) {
        emit(state.copyWith(
            newDeleteCityStatus: DeleteCityError(dataState.error)));
      }
    });
  }
}
