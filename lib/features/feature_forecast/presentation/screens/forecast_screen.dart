import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:weathery/core/params/forecast_param.dart';
import 'package:weathery/features/feature_forecast/domain/entities/forecast_3hourly_entity.dart';
import 'package:weathery/features/feature_forecast/presentation/bloc/f_3hourly_status.dart';
import 'package:weathery/features/feature_forecast/presentation/bloc/forecast_bloc.dart';
import 'package:weathery/features/feature_weather/domain/entities/current_city_entity.dart';
import 'package:weathery/features/feature_weather/domain/use_case/get_current_weather_usecase.dart';

import '../../../../core/utils/date_converter.dart';
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
   var height=MediaQuery.of(context).size.height;
    return SafeArea(
      child: Column(
        children: [
          BlocBuilder<ForecastBloc, ForecastState>(
            builder: (context, state) {
              if (state.f3hourlyState is F3HourlyLoading) {
                return Expanded(child: DotLoadingWidget());
              }

              if (state.f3hourlyState is F3HourlyCompleted) {
                /// casting
                final F3HourlyCompleted f3HourlyCompleted =
                    state.f3hourlyState as F3HourlyCompleted;
                final Forecast3HourlyEntity forecast3HourlyEntity =
                    f3HourlyCompleted.forecast3hourlyEntity;

                List<ChartModel> humidityList = [];
                for (int i = 0; i < forecast3HourlyEntity.list!.length; i++) {
                  humidityList.add(ChartModel(
                      date: DateConverter.changeDtToDateTime(
                              forecast3HourlyEntity.list![i].dt)
                          .toString(),
                      data: forecast3HourlyEntity.list![i].main!.humidity!));

                  debugPrint(humidityList[i].date);
                  debugPrint(humidityList[i].data.toString());
                }

                List<ChartModel> tempList = [];
                for (int i = 0; i < forecast3HourlyEntity.list!.length; i++) {
                  tempList.add(ChartModel(
                      date: DateConverter.changeDtToDateTime(
                          forecast3HourlyEntity.list![i].dt)
                          .toString(),
                      data: forecast3HourlyEntity.list![i].main!.temp!));

                  debugPrint(tempList[i].date);
                  debugPrint(tempList[i].data.toString());
                }


                late TooltipBehavior _tooltipBehavior;
                _tooltipBehavior = TooltipBehavior(
                  enable: true,
                );

                return SizedBox(
                  height: height*0.8,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        /// Humidity
                        Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: Text(
                            forecast3HourlyEntity.city!.name!,
                            style: const TextStyle(
                                fontSize: 30, color: Colors.white),
                          ),
                        ),

                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: SfCartesianChart(
                              primaryXAxis: CategoryAxis(),
                              tooltipBehavior: _tooltipBehavior,
                              margin: EdgeInsets.all(10),
                              title: ChartTitle(
                                  text: 'Humidity',
                                  textStyle: TextStyle(color: Colors.white)),
                              enableSideBySideSeriesPlacement: false,
                              series: <ChartSeries>[
                                // Initialize line series
                                SplineSeries<ChartModel, String>(
                                    dataSource: humidityList,
                                    xValueMapper: (ChartModel data, _) =>
                                        data.date,
                                    yValueMapper: (ChartModel data, _) =>
                                        data.data)
                              ]),
                          height: 200,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: SfCartesianChart(
                              primaryXAxis: CategoryAxis(),
                              tooltipBehavior: _tooltipBehavior,
                              margin: EdgeInsets.all(10),
                              title: ChartTitle(
                                  text: 'Temperature',
                                  textStyle: TextStyle(color: Colors.white)),
                              series: <ChartSeries>[
                                // Initialize line series
                                LineSeries<ChartModel, String>(
                                    dataSource: tempList,
                                    xValueMapper: (ChartModel data, _) =>
                                        data.date,
                                    yValueMapper: (ChartModel data, _) =>
                                        data.data)
                              ]),
                          height: 200,
                        ),

                      ],
                    ),
                  ),
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

class ChartModel {
  final String date;
  final num? data;

  ChartModel({
    required this.date,
    required this.data,
  });
}
