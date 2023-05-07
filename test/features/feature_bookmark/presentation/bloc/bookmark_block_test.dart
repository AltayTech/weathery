import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:weathery/core/resources/data_state.dart';
import 'package:weathery/features/feature_bookmark/domain/entities/city_entity.dart';
import 'package:weathery/features/feature_bookmark/domain/use_case/delete_city_usecase.dart';
import 'package:weathery/features/feature_bookmark/domain/use_case/get_all_city_usecase.dart';
import 'package:weathery/features/feature_bookmark/domain/use_case/get_city_usecase.dart';
import 'package:weathery/features/feature_bookmark/domain/use_case/save_city_usecase.dart';
import 'package:weathery/features/feature_bookmark/presentation/bloc/bookmark_bloc.dart';
import 'package:weathery/features/feature_bookmark/presentation/bloc/delete_city_status.dart';
import 'package:weathery/features/feature_bookmark/presentation/bloc/get_all_city_status.dart';
import 'package:weathery/features/feature_bookmark/presentation/bloc/get_city_status.dart';
import 'package:weathery/features/feature_bookmark/presentation/bloc/save_city_status.dart';

import 'bookmark_block_test.mocks.dart';

@GenerateMocks(
    [GetCityUseCase, SaveCityUseCase, GetAllCityUseCase, DeleteCityUseCase])
void main() {
  String cityName = 'Ankara';
  String error = 'error';

  group('bookmark getCity event test', () {
    ///emit getCityLoading and getCityCompleted state
    MockGetCityUseCase mockGetCityUseCaseC = MockGetCityUseCase();
    MockSaveCityUseCase mockSaveCityUseCaseC = MockSaveCityUseCase();
    MockGetAllCityUseCase mockGetAllCityUseCaseC = MockGetAllCityUseCase();
    MockDeleteCityUseCase mockDeleteCityUseCaseC = MockDeleteCityUseCase();
    when(mockGetCityUseCaseC.call(any))
        .thenAnswer((_) => Future.value(DataSuccess(City(name: cityName))));
    blocTest('emit getCityLoading and getCityCompleted state ', build: () {
      return BookmarkBloc(mockGetCityUseCaseC, mockSaveCityUseCaseC,
          mockGetAllCityUseCaseC, mockDeleteCityUseCaseC);
    }, act: (bloc) {
      bloc.add(GetCityByNameEvent(cityName));
    }, expect: () {
      return <BookmarkState>[
        BookmarkState(
          getCityStatus: GetCityLoading(),
          saveCityStatus: SaveCityInitial(),
          getAllCityStatus: GetAllCityLoading(),
          deleteCityStatus: DeleteCityInitial(),
        ),
        BookmarkState(
          getCityStatus: GetCityCompleted(City(name: cityName)),
          saveCityStatus: SaveCityInitial(),
          getAllCityStatus: GetAllCityLoading(),
          deleteCityStatus: DeleteCityInitial(),
        ),
      ];
    });

    ///emit getCityLoading and getCityFailed state
    MockGetCityUseCase mockGetCityUseCaseF = MockGetCityUseCase();
    MockSaveCityUseCase mockSaveCityUseCaseF = MockSaveCityUseCase();
    MockGetAllCityUseCase mockGetAllCityUseCaseF = MockGetAllCityUseCase();
    MockDeleteCityUseCase mockDeleteCityUseCaseF = MockDeleteCityUseCase();
    when(mockGetCityUseCaseF.call(any))
        .thenAnswer((_) => Future.value(DataFailed(error)));
    blocTest('emit getCityLoading and getCityFailed state ', build: () {
      return BookmarkBloc(mockGetCityUseCaseF, mockSaveCityUseCaseF,
          mockGetAllCityUseCaseF, mockDeleteCityUseCaseF);
    }, act: (bloc) {
      bloc.add(GetCityByNameEvent(cityName));
    }, expect: () {
      return <BookmarkState>[
        BookmarkState(
          getCityStatus: GetCityLoading(),
          saveCityStatus: SaveCityInitial(),
          getAllCityStatus: GetAllCityLoading(),
          deleteCityStatus: DeleteCityInitial(),
        ),
        BookmarkState(
          getCityStatus: GetCityError(error),
          saveCityStatus: SaveCityInitial(),
          getAllCityStatus: GetAllCityLoading(),
          deleteCityStatus: DeleteCityInitial(),
        ),
      ];
    });
  });
  group('bookmark saveCity event test', () {
    ///emit saveCityLoading and saveCityCompleted state
    MockGetCityUseCase mockGetCityUseCaseC = MockGetCityUseCase();
    MockSaveCityUseCase mockSaveCityUseCaseC = MockSaveCityUseCase();
    MockGetAllCityUseCase mockGetAllCityUseCaseC = MockGetAllCityUseCase();
    MockDeleteCityUseCase mockDeleteCityUseCaseC = MockDeleteCityUseCase();
    when(mockSaveCityUseCaseC.call(any))
        .thenAnswer((_) => Future.value(DataSuccess(City(name: cityName))));
    blocTest('emit saveCityLoading and saveCityCompleted state ', build: () {
      return BookmarkBloc(mockGetCityUseCaseC, mockSaveCityUseCaseC,
          mockGetAllCityUseCaseC, mockDeleteCityUseCaseC);
    }, act: (bloc) {
      bloc.add(SaveCityByNameEvent(cityName));
    }, expect: () {
      return <BookmarkState>[
        BookmarkState(
          getCityStatus: GetCityLoading(),
          saveCityStatus: SaveCityLoading(),
          getAllCityStatus: GetAllCityLoading(),
          deleteCityStatus: DeleteCityInitial(),
        ),
        BookmarkState(
          getCityStatus: GetCityLoading(),
          saveCityStatus: SaveCityCompleted(City(name: cityName)),
          getAllCityStatus: GetAllCityLoading(),
          deleteCityStatus: DeleteCityInitial(),
        ),
      ];
    });

    ///emit saveCityLoading and saveCityFailed state
    MockGetCityUseCase mockGetCityUseCaseF = MockGetCityUseCase();
    MockSaveCityUseCase mockSaveCityUseCaseF = MockSaveCityUseCase();
    MockGetAllCityUseCase mockGetAllCityUseCaseF = MockGetAllCityUseCase();
    MockDeleteCityUseCase mockDeleteCityUseCaseF = MockDeleteCityUseCase();
    when(mockSaveCityUseCaseF.call(any))
        .thenAnswer((_) => Future.value(DataFailed(error)));
    blocTest('emit saveCityLoading and saveCityFailed state ', build: () {
      return BookmarkBloc(mockGetCityUseCaseF, mockSaveCityUseCaseF,
          mockGetAllCityUseCaseF, mockDeleteCityUseCaseF);
    }, act: (bloc) {
      bloc.add(SaveCityByNameEvent(cityName));
    }, expect: () {
      return <BookmarkState>[
        BookmarkState(
          getCityStatus: GetCityLoading(),
          saveCityStatus: SaveCityLoading(),
          getAllCityStatus: GetAllCityLoading(),
          deleteCityStatus: DeleteCityInitial(),
        ),
        BookmarkState(
          getCityStatus: GetCityLoading(),
          saveCityStatus: SaveCityError(error),
          getAllCityStatus: GetAllCityLoading(),
          deleteCityStatus: DeleteCityInitial(),
        ),
      ];
    });
  });
  group('bookmark getAllCity event test', () {
    ///emit getAllCityLoading and getAllCityCompleted state
    MockGetCityUseCase mockGetCityUseCaseC = MockGetCityUseCase();
    MockSaveCityUseCase mockSaveCityUseCaseC = MockSaveCityUseCase();
    MockGetAllCityUseCase mockGetAllCityUseCaseC = MockGetAllCityUseCase();
    MockDeleteCityUseCase mockDeleteCityUseCaseC = MockDeleteCityUseCase();
    when(mockGetAllCityUseCaseC.call(any))
        .thenAnswer((_) => Future.value(DataSuccess([City(name: cityName)])));
    blocTest('emit getAllCityLoading and getAllCityCompleted state ',
        build: () {
      return BookmarkBloc(mockGetCityUseCaseC, mockSaveCityUseCaseC,
          mockGetAllCityUseCaseC, mockDeleteCityUseCaseC);
    }, act: (bloc) {
      bloc.add(GetAllCityEvent());
    }, expect: () {
      return <BookmarkState>[
        BookmarkState(
          getCityStatus: GetCityLoading(),
          saveCityStatus: SaveCityInitial(),
          getAllCityStatus: GetAllCityLoading(),
          deleteCityStatus: DeleteCityInitial(),
        ),
        BookmarkState(
          getCityStatus: GetCityLoading(),
          saveCityStatus: SaveCityInitial(),
          getAllCityStatus: GetAllCityCompleted([City(name: cityName)]),
          deleteCityStatus: DeleteCityInitial(),
        ),
      ];
    });

    ///emit getAllCityLoading and getAllCityFailed state
    MockGetCityUseCase mockGetCityUseCaseF = MockGetCityUseCase();
    MockSaveCityUseCase mockSaveCityUseCaseF = MockSaveCityUseCase();
    MockGetAllCityUseCase mockGetAllCityUseCaseF = MockGetAllCityUseCase();
    MockDeleteCityUseCase mockDeleteCityUseCaseF = MockDeleteCityUseCase();
    when(mockGetAllCityUseCaseF.call(any))
        .thenAnswer((_) => Future.value(DataFailed(error)));
    blocTest('emit getAllCityLoading and getAllCityFailed state ', build: () {
      return BookmarkBloc(mockGetCityUseCaseF, mockSaveCityUseCaseF,
          mockGetAllCityUseCaseF, mockDeleteCityUseCaseF);
    }, act: (bloc) {
      bloc.add(GetAllCityEvent());
    }, expect: () {
      return <BookmarkState>[
        BookmarkState(
          getCityStatus: GetCityLoading(),
          saveCityStatus: SaveCityInitial(),
          getAllCityStatus: GetAllCityLoading(),
          deleteCityStatus: DeleteCityInitial(),
        ),
        BookmarkState(
          getCityStatus: GetCityLoading(),
          saveCityStatus: SaveCityInitial(),
          getAllCityStatus: GetAllCityError(error),
          deleteCityStatus: DeleteCityInitial(),
        ),
      ];
    });
  });
  group('bookmark deleteCity event test', () {
    ///emit deleteCityLoading and deleteCityCompleted state
    MockGetCityUseCase mockGetCityUseCaseC = MockGetCityUseCase();
    MockSaveCityUseCase mockSaveCityUseCaseC = MockSaveCityUseCase();
    MockGetAllCityUseCase mockGetAllCityUseCaseC = MockGetAllCityUseCase();
    MockDeleteCityUseCase mockDeleteCityUseCaseC = MockDeleteCityUseCase();
    when(mockDeleteCityUseCaseC.call(any))
        .thenAnswer((_) => Future.value(DataSuccess(cityName)));
    blocTest('emit deleteCityLoading and deleteCityCompleted state ',
        build: () {
      return BookmarkBloc(mockGetCityUseCaseC, mockSaveCityUseCaseC,
          mockGetAllCityUseCaseC, mockDeleteCityUseCaseC);
    }, act: (bloc) {
      bloc.add(DeleteCityByNameEvent(cityName));
    }, expect: () {
      return <BookmarkState>[
        BookmarkState(
          getCityStatus: GetCityLoading(),
          saveCityStatus: SaveCityInitial(),
          getAllCityStatus: GetAllCityLoading(),
          deleteCityStatus: DeleteCityLoading(),
        ),
        BookmarkState(
          getCityStatus: GetCityLoading(),
          saveCityStatus: SaveCityInitial(),
          getAllCityStatus: GetAllCityLoading(),
          deleteCityStatus: DeleteCityCompleted(cityName),
        ),
      ];
    });

    ///emit gdeleteCityLoading and deleteCityFailed state
    MockGetCityUseCase mockGetCityUseCaseF = MockGetCityUseCase();
    MockSaveCityUseCase mockSaveCityUseCaseF = MockSaveCityUseCase();
    MockGetAllCityUseCase mockGetAllCityUseCaseF = MockGetAllCityUseCase();
    MockDeleteCityUseCase mockDeleteCityUseCaseF = MockDeleteCityUseCase();
    when(mockDeleteCityUseCaseF.call(any))
        .thenAnswer((_) => Future.value(DataFailed(error)));
    blocTest('emit deleteCityLoading and deleteCityFailed state ', build: () {
      return BookmarkBloc(mockGetCityUseCaseF, mockSaveCityUseCaseF,
          mockGetAllCityUseCaseF, mockDeleteCityUseCaseF);
    }, act: (bloc) {
      bloc.add(DeleteCityByNameEvent(cityName));
    }, expect: () {
      return <BookmarkState>[
        BookmarkState(
          getCityStatus: GetCityLoading(),
          saveCityStatus: SaveCityInitial(),
          getAllCityStatus: GetAllCityLoading(),
          deleteCityStatus: DeleteCityLoading(),
        ),
        BookmarkState(
          getCityStatus: GetCityLoading(),
          saveCityStatus: SaveCityInitial(),
          getAllCityStatus: GetAllCityLoading(),
          deleteCityStatus: DeleteCityError(error),
        ),
      ];
    });
  });
}
