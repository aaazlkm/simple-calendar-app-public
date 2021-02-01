import 'package:built_collection/built_collection.dart';
import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nifu_flutter_kit/nifu_flutter_kit.dart';
import 'package:simple_calendar_app/core/ex/tz_date_time_ex.dart';
import 'package:simple_calendar_app/domain/calendar/model/event/event_date.dart';
import 'package:timezone/timezone.dart';

part 'multi_date_item_state.freezed.dart';

@freezed
class MultiDateItemState with _$MultiDateItemState {
  const factory MultiDateItemState.gone({
    /// アニメーション用に前回表示していた値を保持しておく
    BuiltList<TZDateTime>? prevSelectedDays,
  }) = MultiDateItemStateGone;

  const factory MultiDateItemState.visible({
    required BuiltList<TZDateTime> selectedDays,
  }) = MultiDateItemStateVisible;

  const MultiDateItemState._();

  bool get isVisible => map(gone: (_) => false, visible: (_) => true);

  bool get isGone => map(gone: (_) => true, visible: (_) => false);

  BuiltList<EventDate> createSelectedEventDates(EventDate originEventDate) => map(
        gone: (gone) => _createSelectedEventDates(originEventDate, gone.prevSelectedDays ?? BuiltList.of([])),
        visible: (visible) => _createSelectedEventDates(originEventDate, visible.selectedDays),
      );

  BuiltList<EventDate> _createSelectedEventDates(EventDate originEventDate, BuiltList<TZDateTime> selectedDates) => selectedDates
      // 元のDateは含まないようにする
      // FIXME 表現がうまくないのでいいのが思いついたら修正する
      .where((e) => !originEventDate.start.isSameDay(e))
      .map(
        (dateTime) => originEventDate.copyWith(
          start: originEventDate.start.copyWith(year: dateTime.year, month: dateTime.month, day: dateTime.day),
          end: originEventDate.end.copyWith(year: dateTime.year, month: dateTime.month, day: dateTime.day).add(Duration(days: originEventDate.diffInDays)),
        ),
      )
      .sorted((a, b) => a.start.compareTo(b.start))
      .toBuiltList();
}
