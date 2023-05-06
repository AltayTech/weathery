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

  group('bookmark event test', () {


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
    },
        act: (bloc) {
          bloc.add(GetCityByNameEvent(cityName));
        },
        expect: () {
          return <BookmarkState>[
            BookmarkState(getCityStatus: GetCityLoading(),
              saveCityStatus: SaveCityInitial(),
              getAllCityStatus: GetAllCityLoading(),
              deleteCityStatus: DeleteCityInitial(),),
            BookmarkState(getCityStatus: GetCityCompleted(City(name: cityName)),
              saveCityStatus: SaveCityInitial(),
              getAllCityStatus: GetAllCityLoading(),
              deleteCityStatus: DeleteCityInitial(),),
          ];
        }
    );

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
    },
        act: (bloc) {
          bloc.add(GetCityByNameEvent(cityName));
        },
        expect: () {
          return <BookmarkState>[
            BookmarkState(getCityStatus: GetCityLoading(),
              saveCityStatus: SaveCityInitial(),
              getAllCityStatus: GetAllCityLoading(),
              deleteCityStatus: DeleteCityInitial(),),
            BookmarkState(getCityStatus: GetCityError(error),
              saveCityStatus: SaveCityInitial(),
              getAllCityStatus: GetAllCityLoading(),
              deleteCityStatus: DeleteCityInitial(),),
          ];
        }
    );


  });
}
