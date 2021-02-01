import 'package:built_collection/built_collection.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:nifu_flutter_kit/nifu_flutter_kit.dart';
import 'package:simple_calendar_app/presentation/port/modal/util/show_floating_modal.dart';
import 'package:simple_calendar_app/presentation/res/localizations/app_localizations.dart';

void showOptionModal(
  BuildContext context, {
  required BuiltList<Option> excludeOptions,
  required ValueChanged<Option> onOptionSelected,
}) =>
    showFloatingModal<void>(
      context: context,
      expand: false,
      duration: const Duration(milliseconds: 250),
      animationCurve: Curves.easeOutSine,
      barrierColor: Colors.black.withOpacity(0.35),
      builder: (context) => _OptionModal(excludeOptions: excludeOptions, onOptionSelected: onOptionSelected),
    );

enum Option {
  multiDates,
  note,
}

class _OptionModal extends StatelessWidget {
  const _OptionModal({
    required this.excludeOptions,
    required this.onOptionSelected,
    Key? key,
  }) : super(key: key);

  final BuiltList<Option> excludeOptions;

  final ValueChanged<Option> onOptionSelected;

  @override
  Widget build(BuildContext context) => Material(
        child: SafeArea(
          top: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const SizedBox(height: Dimens.padding8),
              Container(
                height: Dimens.viewSize4,
                width: Dimens.viewSize40,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onSurface.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(Dimens.radius8),
                ),
              ),
              const SizedBox(height: Dimens.padding16),
              Row(
                children: [
                  const SizedBox(width: Dimens.padding24),
                  Text(
                    AppLocalizations.string(context).eventEdit.optionModalTitle,
                    style: Theme.of(context).textTheme.caption!.copyWith(
                          color: Theme.of(context).colorScheme.onBackground.withOpacity(Dimens.emphasisMedium),
                        ),
                  ),
                  const SizedBox(width: Dimens.padding24),
                ],
              ),
              const SizedBox(height: Dimens.padding20),
              const Divider(height: 1),
              const SizedBox(height: Dimens.padding8),
              ...Option.values.where((e) => !excludeOptions.contains(e)).map((e) => _buildOptionItem(context, e)),
              const SizedBox(height: Dimens.padding12),
            ],
          ),
        ),
      );

  InkWell _buildOptionItem(BuildContext context, Option option) => InkWell(
        onTap: () async {
          await HapticFeedback.lightImpact();
          Navigator.of(context).pop();
          onOptionSelected(option);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: Dimens.padding16, horizontal: Dimens.padding24),
          child: Row(
            children: [
              Icon(
                (() {
                  switch (option) {
                    case Option.note:
                      return FluentIcons.document_one_page_20_regular;
                    case Option.multiDates:
                      return FluentIcons.calendar_multiple_20_regular;
                  }
                })(),
                color: Theme.of(context).colorScheme.onSurface.withOpacity(Dimens.emphasisLow),
              ),
              const SizedBox(width: Dimens.padding16),
              Text(
                (() {
                  switch (option) {
                    case Option.multiDates:
                      return AppLocalizations.string(context).eventEdit.optionMultiDate;
                    case Option.note:
                      return AppLocalizations.string(context).eventEdit.optionNote;
                  }
                })(),
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface.withOpacity(Dimens.emphasisHigh),
                    ),
              ),
            ],
          ),
        ),
      );
}
