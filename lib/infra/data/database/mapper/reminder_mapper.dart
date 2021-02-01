import 'package:simple_calendar_app/domain/calendar/model/reminder/reminder.dart';
import 'package:simple_calendar_app/domain/calendar/model/reminder/reminder_id.dart';
import 'package:simple_calendar_app/infra/data/database/table/reminder_table.dart';

class ReminderMapper {
  static Reminder fromTable(ReminderTable table) => Reminder(
        id: ReminderId(value: table.id),
        minutes: table.minutes,
      );

  static ReminderTable toTable(Reminder reminder) => ReminderTable(
        id: reminder.id.value,
        minutes: reminder.minutes,
      );
}
