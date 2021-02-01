import 'package:built_collection/built_collection.dart';
import 'package:simple_calendar_app/domain/calendar/model/event/event.dart';
import 'package:timezone/timezone.dart';

class MultiDateArgument {
  MultiDateArgument({
    required this.event,
    DateTime? initialYearMonth,
    BuiltList<TZDateTime>? initialDateTimes,
  })  : initialYearMonth = initialYearMonth ?? DateTime(DateTime.now().year, DateTime.now().month),
        initialDateTimes = initialDateTimes ?? BuiltList.of([]);

  final Event event;
  final DateTime initialYearMonth;
  final BuiltList<TZDateTime> initialDateTimes;
}
