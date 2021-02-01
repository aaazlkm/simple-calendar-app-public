import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:nifu_flutter_kit/nifu_flutter_kit.dart';
import 'package:simple_calendar_app/presentation/pages/event/edit/event_edit_page.dart';
import 'package:simple_calendar_app/presentation/res/localizations/app_localizations.dart';

class AddOptionItemView extends StatelessWidget {
  const AddOptionItemView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
        children: [
          const SizedBox(width: Dimens.padding8),
          BouncingWidget(
            duration: const Duration(milliseconds: 75),
            scaleFactor: 0.5,
            onPressed: () => EventEditController.of(context).onAddOptionButtonTap(),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: Dimens.padding16, horizontal: Dimens.padding16),
              child: Row(
                children: [
                  Icon(
                    FluentIcons.add_circle_20_regular,
                    size: Dimens.viewSize24,
                    color: Theme.of(context).colorScheme.onSurface.withOpacity(Dimens.emphasisLow),
                  ),
                  const SizedBox(width: Dimens.padding24),
                  Text(
                    AppLocalizations.string(context).eventEdit.addItemText,
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          fontSize: Dimens.fontSize14,
                        ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: Dimens.padding8),
        ],
      );
}
