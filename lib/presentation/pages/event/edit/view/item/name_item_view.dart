import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nifu_flutter_kit/nifu_flutter_kit.dart';
import 'package:nifu_flutter_kit/resources/dimens.dart';
import 'package:simple_calendar_app/presentation/pages/event/edit/controller/name_text_editing_cotroller.dart';
import 'package:simple_calendar_app/presentation/pages/event/edit/event_edit_page.dart';
import 'package:simple_calendar_app/presentation/res/localizations/app_localizations.dart';

class NameItemView extends StatelessWidget {
  const NameItemView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
        children: [
          const SizedBox(width: Dimens.padding48),
          const SizedBox(width: Dimens.padding24),
          Expanded(
            child: Focus(
              onFocusChange: (hasFocus) => EventEditController.of(context).onNameTextFieldFocusChanged(hasFocus: hasFocus),
              child: TextField(
                controller: NameTextEditingController.of(context).textEditingController,
                focusNode: NameTextEditingController.of(context).focusNode,
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground.withOpacity(Dimens.emphasisHigh),
                      fontWeight: FontWeight.bold,
                    ),
                decoration: InputDecoration(
                  hintText: AppLocalizations.string(context).eventEdit.nameHint,
                  hintStyle: Theme.of(context).textTheme.headline6?.copyWith(
                        color: Theme.of(context).colorScheme.onBackground.withOpacity(Dimens.emphasisLow),
                        fontWeight: FontWeight.bold,
                      ),
                  border: InputBorder.none,
                ),
                textInputAction: TextInputAction.done,
                onTap: () => EventEditController.of(context).onNameItemTap(),
                onChanged: (text) => EventEditController.of(context).onNameChanged(text),
              ),
            ),
          ),
          const SizedBox(width: Dimens.padding24),
        ],
      );
}
