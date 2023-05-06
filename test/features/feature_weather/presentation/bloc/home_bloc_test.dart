import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:weathery/core/params/forecast_param.dart';
import 'package:weathery/core/resources/data_state.dart';
import 'package:weathery/features/feature_weather/domain/entities/current_city_entity.dart';
import 'package:weathery/features/feature_weather/domain/entities/forecast_days_entity.dart';
import 'package:weathery/features/feature_weather/domain/use_case/get_current_weather_usecase.dart';
import 'package:weathery/features/feature_weather/domain/use_case/get_forecast_weather_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:weathery/features/feature_weather/presentation/bloc/cw_status.dart';
import 'package:weathery/features/feature_weather/presentation/bloc/fw_status.dart';
import 'package:weathery/features/feature_weather/presentation/bloc/home_bloc.dart';
import 'home_bloc_test.mocks.dart';

@GenerateMocks([GetCurrentWeatherUseCase, GetForecastWeatherUseCase])
void main() {
  String cityName = 'Ankara';
  String error = 'error';
  num lat = 39.925533;
  num lon = 32.866287;

  group('Current Weather event test', () {
    ///emit loading state and completed state
    MockGetCurrentWeatherUseCase mockGetCurrentWeatherUseCaseC =
        MockGetCurrentWeatherUseCase();
    MockGetForecastWeatherUseCase mockGetForecastWeatherUseCaseC =
        MockGetForecastWeatherUseCase();

    when(mockGetCurrentWeatherUseCaseC.call(any))
        .thenAnswer((_) => Future.value(DataSuccess(CurrentCityEntity())));

    blocTest('emit loading state and completed state',
        build: () => HomeBloc(
            mockGetCurrentWeatherUseCaseC, mockGetForecastWeatherUseCaseC),
        act: (bloc) {
          bloc.add(LoadCwEvent(cityName));
        },
        expect: () {
          return <HomeState>[
            HomeState(cwStatus: CwLoading(), fwStatus: FwLoading()),
            HomeState(
                cwStatus: CwCompleted(CurrentCityEntity()),
                fwStatus: FwLoading())
          ];
        });

    ///emit loading state and failed state
    MockGetCurrentWeatherUseCase mockGetCurrentWeatherUseCaseE =
        MockGetCurrentWeatherUseCase();
    MockGetForecastWeatherUseCase mockGetForecastWeatherUseCaseE =
        MockGetForecastWeatherUseCase();
    when(mockGetCurrentWeatherUseCaseE.call(any))
        .thenAnswer((_) => Future.value(DataFailed(error)));

    blocTest('emit loading state and failed state',
        build: () => HomeBloc(
            mockGetCurrentWeatherUseCaseE, mockGetForecastWeatherUseCaseE),
        act: (bloc) {
          bloc.add(LoadCwEvent(cityName));
        },
        expect: () {
          return <HomeState>[
            HomeState(cwStatus: CwLoading(), fwStatus: FwLoading()),
            HomeState(cwStatus: CwError(error), fwStatus: FwLoading())
          ];
        });
  });

  group('Forecast Weather event test', () {
    ///emit loading state and completed state
    MockGetCurrentWeatherUseCase mockGetCurrentWeatherUseCaseC =
        MockGetCurrentWeatherUseCase();
    MockGetForecastWeatherUseCase mockGetForecastWeatherUseCaseC =
        MockGetForecastWeatherUseCase();

    when(mockGetForecastWeatherUseCaseC.call(any))
        .thenAnswer((_) => Future.value(DataSuccess(ForecastDaysEntity())));

    blocTest('emit loading state and completed state',
        build: () => HomeBloc(
            mockGetCurrentWeatherUseCaseC, mockGetForecastWeatherUseCaseC),
        act: (bloc) {
          bloc.add(LoadFwEvent(ForecastParams(lat, lon)));
        },
        expect: () {
          return <HomeState>[
            HomeState(cwStatus: CwLoading(), fwStatus: FwLoading()),
            HomeState(
                cwStatus: CwLoading(),
                fwStatus: FwCompleted(ForecastDaysEntity()))
          ];
        });

    ///emit loading state and Error state
    MockGetCurrentWeatherUseCase mockGetCurrentWeatherUseCaseE =
        MockGetCurrentWeatherUseCase();
    MockGetForecastWeatherUseCase mockGetForecastWeatherUseCaseE =
        MockGetForecastWeatherUseCase();

    when(mockGetForecastWeatherUseCaseE.call(any))
        .thenAnswer((_) => Future.value(DataFailed(error)));

    blocTest('emit loading state and Error state',
        build: () => HomeBloc(
            mockGetCurrentWeatherUseCaseE, mockGetForecastWeatherUseCaseE),
        act: (bloc) {
          bloc.add(LoadFwEvent(ForecastParams(lat, lon)));
        },
        expect: () {
          return <HomeState>[
            HomeState(cwStatus: CwLoading(), fwStatus: FwLoading()),
            HomeState(cwStatus: CwLoading(), fwStatus: FwError(error)),
          ];
        });
  });
}
