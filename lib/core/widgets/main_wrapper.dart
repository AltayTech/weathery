import 'package:flutter/material.dart';
import 'package:weathery/core/widgets/app_background.dart';
import 'package:weathery/core/widgets/bottom_nav.dart';
import 'package:weathery/features/feature_bookmark/presentation/screens/bookmark_screen.dart';
import 'package:weathery/features/feature_weather/presentation/screens/home_screen.dart';

class MainWrapper extends StatelessWidget {
  MainWrapper({Key? key}) : super(key: key);

  final PageController pageController = PageController(initialPage: 0);
  List<Widget> pageViewWidget = [
    const HomeScreen(),
    const BookmarkScreen(),
  ];
  @override
  Widget build(BuildContext context) {

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
