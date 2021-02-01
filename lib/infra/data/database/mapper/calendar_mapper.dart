import 'package:simple_calendar_app/domain/calendar/model/calendar/calendar.dart';
import 'package:simple_calendar_app/domain/calendar/model/calendar/calendar_id.dart';
import 'package:simple_calendar_app/infra/data/database/table/calendar_table.dart';

class CalendarMapper {
  static Calendar fromTable(CalendarTable table) => Calendar(
        id: CalendarId(value: table.id),
        name: table.name,
      );

  static CalendarTable toTable(Calendar calendar) => CalendarTable(
        id: calendar.id.value,
        name: calendar.name,
      );
}
