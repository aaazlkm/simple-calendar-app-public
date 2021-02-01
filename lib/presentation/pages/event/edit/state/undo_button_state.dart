import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:simple_calendar_app/presentation/pages/event/edit/state/undo_cache_store.dart';

part 'undo_button_state.freezed.dart';

@freezed
class UndoButtonState with _$UndoButtonState {
  const factory UndoButtonState.visible({
    required UndoCacheStore cacheStore,
  }) = UndoButtonStateNote;

  const factory UndoButtonState.gone() = UndoButtonStateNone;

  const UndoButtonState._();

  bool get isVisible => maybeMap(
        visible: (_) => true,
        orElse: () => false,
      );
}
