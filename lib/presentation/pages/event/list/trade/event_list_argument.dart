import 'package:simple_calendar_app/domain/calendar/model/calendar/calendar.dart';

class EventListArgument {
  EventListArgument({
    required this.calendar,
    required this.day,
  });

  final Calendar calendar;

  final DateTime day;
}
