import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weathery/core/widgets/bottom_nav.dart';

void main() {
  group(
      'Click on bookmark icon in bottom_nav and move page to  page 1(bookmark)  '
          'and Click on home icon icon return to page 0 (home) in page view',
      () {
        PageController pageController = PageController();


    testWidgets(
      'Click on bookmark icon in bottom_nav and move page to  page 1(bookmark)',
      (widgetTester) async {
        PageController pageController = PageController();
        await widgetTester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              bottomNavigationBar: BottomNav(
                pageController: pageController,
              ),
              body: PageView(
                controller: pageController,
                children: [Container(), Container()],
              ),
            ),
          ),
        );
        await widgetTester.tap(find.widgetWithIcon(IconButton, Icons.bookmark));
        await widgetTester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              bottomNavigationBar: BottomNav(
                pageController: pageController,
              ),
              body: PageView(
                controller: pageController,
                children: [Container(), Container()],
              ),
            ),
          ),
        );
        await widgetTester.tap(find.widgetWithIcon(IconButton, Icons.bookmark));
        await widgetTester.pumpAndSettle();
        expect(pageController.page, 1);

      },
    );
    testWidgets(
      'Click on home icon and move to page 0 (home) in page view',
      (widgetTester) async {
        PageController pageController = PageController();

        await widgetTester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              bottomNavigationBar: BottomNav(
                pageController: pageController,
              ),
              body: PageView(
                controller: pageController,
                children: [Container(), Container()],
              ),
            ),
          ),
        );

        await widgetTester.tap(find.widgetWithIcon(IconButton, Icons.home));
        await widgetTester.pumpAndSettle();
        expect(pageController.page, 0);
      },
    );
  });
}
