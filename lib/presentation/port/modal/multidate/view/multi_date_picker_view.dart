import 'dart:math';

import 'package:flutter/material.dart';
import 'package:nifu_flutter_kit/nifu_flutter_kit.dart';
import 'package:simple_calendar_app/presentation/port/modal/multidate/view/multi_date_body_view.dart';
import 'package:simple_calendar_app/presentation/res/localizations/app_localizations.dart';

class MultiDatePickerView extends StatelessWidget {
  const MultiDatePickerView({Key? key}) : super(key: key);

  static const height = 650.0;

  @override
  Widget build(BuildContext context) => Material(
        child: SafeArea(
          top: false,
          child: SizedBox(
            height: min(height, MediaQuery.of(context).size.height),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                _TopControl(),
                Divider(height: 1),
                Expanded(child: MultiDateBodyView()),
              ],
            ),
          ),
        ),
      );
}

class _TopControl extends StatelessWidget {
  const _TopControl({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        color: Theme.of(context).colorScheme.surface,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: Dimens.padding8),
              child: Container(
                height: Dimens.viewSize4,
                width: Dimens.viewSize40,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onSurface.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(Dimens.radius8),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: Dimens.padding20),
              child: Row(
                children: [
                  const SizedBox(width: Dimens.padding24),
                  Text(
                    AppLocalizations.string(context).multiDate.topControlTitle,
                    style: Theme.of(context).textTheme.caption!.copyWith(
                          color: Theme.of(context).colorScheme.onBackground.withOpacity(Dimens.emphasisLow),
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(width: Dimens.padding24),
                ],
              ),
            ),
          ],
        ),
      );
}
