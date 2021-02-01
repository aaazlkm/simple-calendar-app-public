import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nifu_flutter_kit/nifu_flutter_kit.dart';
import 'package:nifu_flutter_kit/resources/dimens.dart';
import 'package:simple_calendar_app/presentation/pages/event/edit/controller/note_text_editing_controller.dart';
import 'package:simple_calendar_app/presentation/pages/event/edit/event_edit_page.dart';
import 'package:simple_calendar_app/presentation/res/localizations/app_localizations.dart';

class NoteItemView extends StatelessWidget {
  const NoteItemView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: Dimens.padding4),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(width: Dimens.padding24),
            Padding(
              padding: const EdgeInsets.only(top: Dimens.padding12),
              child: Icon(
                FluentIcons.document_one_page_20_regular,
                color: Theme.of(context).colorScheme.onBackground.withOpacity(Dimens.emphasisLow),
              ),
            ),
            const SizedBox(width: Dimens.padding24),
            Expanded(
              child: TextField(
                controller: NoteTextEditingController.of(context).textEditingController,
                focusNode: NoteTextEditingController.of(context).focusNode,
                style: Theme.of(context).textTheme.caption!.copyWith(
                      fontSize: Dimens.fontSize14,
                    ),
                decoration: InputDecoration(
                  hintText: AppLocalizations.string(context).eventEdit.noteHint,
                  hintStyle: Theme.of(context).textTheme.caption?.copyWith(
                        fontSize: Dimens.fontSize14,
                        color: Theme.of(context).colorScheme.onBackground.withOpacity(Dimens.emphasisLow),
                      ),
                  border: InputBorder.none,
                ),
                keyboardType: TextInputType.multiline,
                maxLines: null,
                onTap: () => EventEditController.of(context).onNoteItemTap(),
                onChanged: (text) => EventEditController.of(context).onNoteChanged(text),
              ),
            ),
            InkResponse(
              onTap: () => EventEditController.of(context).onNoteDismissButtonTap(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: Dimens.padding12, vertical: Dimens.padding16),
                child: Icon(
                  FluentIcons.dismiss_24_filled,
                  size: Dimens.viewSize16,
                  color: Theme.of(context).colorScheme.onBackground.withOpacity(Dimens.emphasisLow),
                ),
              ),
            ),
            const SizedBox(width: Dimens.padding24 - 1.5), // time buttonと揃えるため
          ],
        ),
      );
}
