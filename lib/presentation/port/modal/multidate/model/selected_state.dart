import 'package:built_collection/built_collection.dart';
import 'package:nifu_flutter_kit/nifu_flutter_kit.dart';
import 'package:simple_calendar_app/domain/calendar/model/event/event.dart';
import 'package:simple_calendar_app/domain/calendar/model/event/event_date.dart';
import 'package:timezone/timezone.dart';

class SelectedState {
  SelectedState({
    required this.originEvent,
    required BuiltList<TZDateTime> days,
  }) : selectedDays = days
            .where(
              (dateTime) => !originEvent.eventDate.start.isSameDay(dateTime), // originEventの日付は選択できない
            )
            .toBuiltList();

  final Event originEvent;

  final BuiltList<TZDateTime> selectedDays;

  late final BuiltList<Event> events = [
    originEvent,
    ...selectedDays.map(
      (dateTime) => originEvent.copyWith(
        eventDate: EventDate.range(
          start: dateTime,
          end: dateTime.add(Duration(days: originEvent.eventDate.diffInDays)),
        ),
      ),
    )
  ].toBuiltList();

  bool isOriginEvent(Event event) => isDayOfOriginEvent(event.eventDate.start);

  bool isDayOfOriginEvent(TZDateTime day) => originEvent.eventDate.start.isSameDay(day);

  bool hasDate(TZDateTime dateTime) => selectedDays.where((e) => e.isSameDay(dateTime)).isNotEmpty;

  SelectedState addDay(TZDateTime day) => copyWith(
        selectedDays: selectedDays.rebuild((list) => list..add(day)),
      );

  SelectedState removeDay(TZDateTime day) => copyWith(
        selectedDays: selectedDays.where((e) => !e.isSameDay(day)).toBuiltList(),
      );

  SelectedState copyWith({
    Event? originEvent,
    BuiltList<TZDateTime>? selectedDays,
  }) =>
      SelectedState(
        originEvent: originEvent ?? this.originEvent,
        days: selectedDays ?? this.selectedDays,
      );
}
