import 'dart:math';

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nifu_flutter_kit/nifu_flutter_kit.dart';
import 'package:simple_calendar_app/presentation/pages/event/edit/event_edit_page.dart';
import 'package:simple_calendar_app/presentation/pages/event/edit/event_edit_view_model.dart';
import 'package:simple_calendar_app/presentation/pages/event/edit/view/event_edit_body_view.dart';

class EventEditPageView extends StatelessWidget {
  const EventEditPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => WillPopScope(
        onWillPop: () => EventEditController.of(context).onWillPop(),
        child: SizedBox(
          height: min(MediaQuery.of(context).size.height, 800),
          child: Column(
            children: [
              const _EventEditTopControl(),
              Expanded(
                child: Scaffold(
                  backgroundColor: Theme.of(context).colorScheme.surface,
                  floatingActionButton: buildFloatingActionButton(context),
                  body: const SafeArea(child: EventEditBodyView()),
                ),
              ),
            ],
          ),
        ),
      );

  Widget buildFloatingActionButton(BuildContext context) => Padding(
        padding: const EdgeInsets.only(right: Dimens.padding8), // time buttonと揃えるため
        child: FloatingActionButton(
          backgroundColor: Theme.of(context).colorScheme.secondary,
          onPressed: () => EventEditController.of(context).onFloatingActionButtonTap(),
          child: Icon(
            FluentIcons.checkmark_24_filled,
            color: Theme.of(context).colorScheme.onSecondary,
          ),
        ),
      );
}

class _EventEditTopControl extends StatelessWidget {
  const _EventEditTopControl({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(
        height: Dimens.viewSize56,
        child: Stack(
          children: [
            Align(
              child: Container(
                height: Dimens.viewSize4,
                width: Dimens.viewSize40,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onSurface.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(Dimens.radius8),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: Dimens.padding24),
                child: StreamBuilder<bool>(
                  stream: EventEditViewModelData.of(context).deleteButtonVisible,
                  initialData: EventEditViewModelData.of(context).deleteButtonVisibleValue,
                  builder: (context, snapshot) => Visibility(
                    visible: snapshot.requireData,
                    child: Material(
                      borderRadius: const BorderRadius.all(Radius.circular(Dimens.radius32)),
                      elevation: 1.5,
                      color: Theme.of(context).colorScheme.background,
                      child: InkWell(
                        borderRadius: const BorderRadius.all(Radius.circular(Dimens.radius16)),
                        onTap: () => EventEditController.of(context).onDeleteButtonTap(),
                        child: Padding(
                          padding: const EdgeInsets.all(Dimens.padding6),
                          child: Icon(
                            FluentIcons.delete_20_regular,
                            color: Theme.of(context).colorScheme.onSurface.withOpacity(Dimens.emphasisMedium),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
