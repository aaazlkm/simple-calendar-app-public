import 'dart:math';

import 'package:flutter/material.dart';
import 'package:nifu_flutter_kit/nifu_flutter_kit.dart';
import 'package:simple_calendar_app/presentation/pages/notification/view/notification_body_view.dart';
import 'package:simple_calendar_app/presentation/res/localizations/app_localizations.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(
        height: min(MediaQuery.of(context).size.height, 800),
        child: Column(
          children: [
            const _TopControl(),
            Divider(
              height: 0.5,
              color: Theme.of(context).colorScheme.onBackground.withOpacity(0.15),
            ),
            Expanded(
              child: Scaffold(
                backgroundColor: Theme.of(context).colorScheme.background,
                body: const SafeArea(child: NotificationBodyView()),
              ),
            ),
          ],
        ),
      );
}

class _TopControl extends StatelessWidget {
  const _TopControl({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Material(
        color: Theme.of(context).colorScheme.background,
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: Dimens.padding8),
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
                padding: const EdgeInsets.symmetric(vertical: Dimens.padding16),
                child: Text(
                  AppLocalizations.string(context).setting.itemNotification,
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              )
            ],
          ),
        ),
      );
}
