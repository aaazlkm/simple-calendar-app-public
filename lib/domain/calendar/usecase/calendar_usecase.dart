import 'package:built_collection/built_collection.dart';
import 'package:result/result.dart';
import 'package:simple_calendar_app/core/constant.dart';
import 'package:simple_calendar_app/domain/calendar/gateway/calendar_repository.dart';
import 'package:simple_calendar_app/domain/calendar/model/calendar/calendar_id.dart';
import 'package:simple_calendar_app/domain/calendar/model/event/event.dart';
import 'package:simple_calendar_app/domain/calendar/model/history/event_history.dart';
import 'package:simple_calendar_app/domain/calendar/usecase/event_history_usecase.dart';

class CalendarUseCase {
  CalendarUseCase({
    required this.calendarRepository,
    required this.eventHistoryUseCase,
  });

  final CalendarRepository calendarRepository;

  final EventHistoryUseCase eventHistoryUseCase;

  Future<Result<Complete>> makeSureDefaultCalendarSaved() => Future(() async {
        final defaultCalendar = Constant.defaultCalendar;
        final calendars = await calendarRepository.fetchAllCalendars();
        if (!calendars.contains(defaultCalendar)) {
          await calendarRepository.saveOrUpdateCalendars([defaultCalendar]);
        }
      }).toComplete();

  Future<Result<BuiltList<Event>>> fetchAllEvents(CalendarId calendarId) => calendarRepository.fetchCalendarEvents(calendarId: calendarId.value).then((value) => value.toBuiltList()).toResult();

  Future<Result<Complete>> saveOrUpdateEvent(Event event) => Future(() async {
        await calendarRepository.saveOrUpdateEvents([event]);
        final result = await eventHistoryUseCase.saveOrUpdateEventHistoryNameAsKey(EventHistory.fromEvent(event));
        result.throwIfFailure();
      }).toComplete();

  Future<Result<Complete>> saveOrUpdateEvents(BuiltList<Event> events) => Future(() async {
        await calendarRepository.saveOrUpdateEvents(events.toList());
        final result = await eventHistoryUseCase.saveOrUpdateEventHistoriesNameAsKey(events.map(EventHistory.fromEvent).toBuiltList());
        result.throwIfFailure();
      }).toComplete();

  Future<Result<Complete>> deleteEvent(Event event) => Future(() async {
        await calendarRepository.deleteEvents([event]);
      }).toComplete();
}
