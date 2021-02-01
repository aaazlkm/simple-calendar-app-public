import 'package:timezone/timezone.dart';

extension DateTimeEx on DateTime {
  static DateTime from(TZDateTime tzDateTime) => DateTime(
        tzDateTime.year,
        tzDateTime.month,
        tzDateTime.day,
        tzDateTime.hour,
        tzDateTime.minute,
        tzDateTime.second,
        tzDateTime.millisecond,
        tzDateTime.microsecond,
      );
}
