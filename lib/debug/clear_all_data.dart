import 'package:simple_calendar_app/core/constant.dart';
import 'package:simple_calendar_app/domain/calendar/usecase/calendar_usecase.dart';
import 'package:simple_calendar_app/locator/locator.dart';

Future<void> clearAllData() async {
  final calendar = Constant.defaultCalendar;
  final calendarUseCase = locator.get<CalendarUseCase>();
  final allEvents = await calendarUseCase.fetchAllEvents(calendar.id);
  allEvents.dataOrNull?.forEach(calendarUseCase.deleteEvent);
}
