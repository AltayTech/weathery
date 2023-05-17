import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weathery/core/params/forecast_param.dart';
import 'package:weathery/features/feature_forecast/presentation/bloc/f_3hourly_status.dart';
import 'package:weathery/features/feature_forecast/presentation/bloc/forecast_bloc.dart';
import 'package:weathery/features/feature_weather/domain/entities/current_city_entity.dart';
import 'package:weathery/features/feature_weather/domain/use_case/get_current_weather_usecase.dart';

import '../../../../core/widgets/dot_loading_widget.dart';
import '../../../../locator.dart';
import '../../../feature_weather/presentation/bloc/home_bloc.dart';

class ForecastScreen extends StatefulWidget {
  const ForecastScreen({Key? key}) : super(key: key);

  @override
  State<ForecastScreen> createState() => _ForecastScreenState();
}

class _ForecastScreenState extends State<ForecastScreen> {
  GetCurrentWeatherUseCase getCurrentWeatherUseCase =
      GetCurrentWeatherUseCase(locator());

  @override
  void initState() {
    super.initState();

    /// get current city info
    CurrentCityEntity currentCityEntity =
        BlocProvider.of<HomeBloc>(context).state.cwStatus.currentCityEntity;
    debugPrint(currentCityEntity.coord?.lat.toString());

    /// create params for api call
    final ForecastParams forecastParams = ForecastParams(
        currentCityEntity.coord!.lat!, currentCityEntity.coord!.lon!);

    BlocProvider.of<ForecastBloc>(context)
        .add(LoadF3HourlyEvent(forecastParams));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          BlocBuilder<ForecastBloc, ForecastState>(
            builder: (context, state) {
              if (state.f3hourlyState is F3HourlyLoading) {
                return Expanded(child: DotLoadingWidget());
              }

              if (state.f3hourlyState is F3HourlyCompleted) {
                return Expanded(
                  child: Container(
                      child: Center(
                    child: Text(
                      'completed',
                      style: TextStyle(color: Colors.white, fontSize: 48),
                    ),
                  )),
                );
              }

              return Container();
            },
          )
        ],
      ),
    );
  }
}
