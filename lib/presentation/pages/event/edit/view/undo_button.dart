import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:nifu_flutter_kit/nifu_flutter_kit.dart';
import 'package:simple_calendar_app/presentation/pages/event/edit/event_edit_page.dart';
import 'package:simple_calendar_app/presentation/pages/event/edit/event_edit_view_model.dart';
import 'package:simple_calendar_app/presentation/pages/event/edit/state/undo_button_state.dart';

class UndoButton extends StatelessWidget {
  const UndoButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(Dimens.padding16),
        child: StreamBuilder<UndoButtonState>(
          stream: EventEditViewModelData.of(context).undoButtonState,
          initialData: EventEditViewModelData.of(context).undoButtonState.value,
          builder: (context, snapshot) => AnimatedVisibility(
            visible: snapshot.requireData.isVisible,
            duration: const Duration(milliseconds: 100),
            child: SizedBox.fromSize(
              size: const Size.square(Dimens.viewSize48),
              child: FloatingActionButton(
                heroTag: null,
                backgroundColor: Theme.of(context).colorScheme.background,
                onPressed: () => EventEditController.of(context).onUndoButtonTap(snapshot.requireData),
                child: Icon(
                  FluentIcons.arrow_reply_down_20_regular,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ),
          ),
        ),
      );
}
