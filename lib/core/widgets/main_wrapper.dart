import 'package:flutter/material.dart';
import 'package:weathery/core/widgets/app_background.dart';
import 'package:weathery/core/widgets/bottom_nav.dart';
import 'package:weathery/features/feature_forecast/presentation/screens/forecast_screen.dart';
import 'package:weathery/features/feature_weather/presentation/screens/home_screen.dart';

import '../../features/feature_bookmark/presentation/screens/bookmark_screen.dart';

class MainWrapper extends StatelessWidget {
  MainWrapper({Key? key}) : super(key: key);

  final PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    List<Widget> pageViewWidget = [
      const HomeScreen(),
      BookmarkScreen(pageController: pageController),
      ForecastScreen(),
    ];
    // var height = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: BottomNav(pageController: pageController),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AppBackground.getBackGroundImage(),
            fit: BoxFit.cover,
          ),
        ),

        // height: height,
        child: PageView(
          controller: pageController,
          children: pageViewWidget,
        ),
      ),
    );
  }
}
