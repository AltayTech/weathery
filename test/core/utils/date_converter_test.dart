import 'package:flutter_test/flutter_test.dart';
import 'package:weathery/core/utils/date_converter.dart';

void main() {
  num dt = 1689239883;

  ///2023 July 13, 9:18:03 AM

  test('return Jul 13', () {
    num dt = 1689239883;

    String date = DateConverter.changeDtToDateTime(dt);

    expect(date, 'Jul 13');
  });

  test('test for return 9:18 AM', () {
    num dt = 1689239883;

    String date = DateConverter.changeDtToDateTimeHour(dt, 0);

    expect(date, '9:18 AM');
  });

  test('test for return 12:18 PM timezone:3:00', () {
    num dt = 1689239883;

    String date = DateConverter.changeDtToDateTimeHour(dt,3*60*60);

    expect(date, '12:18 PM');
  });

}
