// import 'package:dio/dio.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:weathery/core/resources/data_state.dart';
// import 'package:weathery/features/feature_weather/data/data_source/remote/api_provider.dart';
// import 'package:weathery/features/feature_weather/domain/entities/current_city_entity.dart';
// import 'package:weathery/features/feature_weather/domain/repositories/weather_repository.dart';
//
// import '../models/current_city_model.dart';
//
// class WeatherRepositoryImpl extends WeatherRepository {
//   late ApiProvider apiProvider;
//
//   WeatherRepositoryImpl(this.apiProvider);
//
//   @override
//   Future<DataState<CurrentCityEntity>> fetchCurrentWeatherData(
//       String cityName) async {
//     try {
//       Response response = await apiProvider.callCurrentWeather(cityName);
//       debugPrint('response.toString()');
//       debugPrint(response.toString());
//       debugPrint(response.data.toString());
//
//       if (response.statusCode == 200) {
//         CurrentCityEntity currentCityEntity =
//             CurrentCityModel.fromJson(response.data);
//         debugPrint('currentCityEntity.toString()');
//         // debugPrint(currentCityEntity.coord.toString());
//
//         return DataSuccess(currentCityEntity);
//       } else {
//         return DataFiald('Something went wrong...');
//       }
//     } catch (e) {
//       debugPrint('e.toString()');
//       debugPrint(e.toString());
//
//       return DataFiald(e.toString());
//     }
//   }
// }
