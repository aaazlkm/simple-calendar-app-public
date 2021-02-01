import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:simple_calendar_app/domain/calendar/model/calendar/calendar.dart';
import 'package:simple_calendar_app/domain/calendar/model/event/event.dart';

part 'event_edit_argument.freezed.dart';

@freezed
class EventEditArgument with _$EventEditArgument {
  const factory EventEditArgument.newItem({
    required final Calendar calendar,
    final DateTime? dateTime,
  }) = EventEditArgumentNewItem;

  const factory EventEditArgument.edit({
    required final Calendar calendar,
    required final Event event,
  }) = EventEditArgumentEdit;
}
