import 'package:get_it/get_it.dart';
import 'package:weathery/features/feature_weather/data/data_source/remote/api_provider.dart';
import 'package:weathery/features/feature_weather/domain/repositories/weather_repository.dart';
import 'package:weathery/features/feature_weather/domain/use_case/get_current_weather_usecase.dart';
import 'package:weathery/features/feature_weather/presentation/bloc/home_bloc.dart';

import 'features/feature_weather/data/repository/weather_repository_impl.dart';

GetIt locator = GetIt.instance;

setup() {
  locator.registerSingleton<ApiProvider>(ApiProvider());

  /// register weatherREpository

  locator
      .registerSingleton<WeatherRepository>(WeatherRepositoryImpl(locator()));

  /// register use case

  locator.registerSingleton<GetCurrentWeatherUseCase>(
      GetCurrentWeatherUseCase(locator()));

  /// register HomeBloc

  locator.registerSingleton<HomeBloc>(HomeBloc(locator()));
}
