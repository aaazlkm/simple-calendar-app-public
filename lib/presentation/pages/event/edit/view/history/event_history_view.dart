import 'package:built_collection/built_collection.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:implicitly_animated_reorderable_list/implicitly_animated_reorderable_list.dart';
import 'package:implicitly_animated_reorderable_list/transitions.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:nifu_flutter_kit/resources/dimens.dart';
import 'package:simple_calendar_app/domain/calendar/model/history/event_history.dart';
import 'package:simple_calendar_app/presentation/pages/event/edit/event_edit_page.dart';
import 'package:simple_calendar_app/presentation/res/localizations/app_localizations.dart';

class EventHistoryView extends StatelessWidget {
  const EventHistoryView({
    required this.eventHistories,
    Key? key,
  }) : super(key: key);

  final BuiltList<EventHistory> eventHistories;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 1), // sheetにpaddingが入っておりズレが生じるため、それを解消する
        child: Material(
          child: Column(
            children: [
              const _EventHistoryCaption(),
              const Divider(height: 1),
              Expanded(
                child: ImplicitlyAnimatedList<EventHistory>(
                  controller: ModalScrollController.of(context),
                  items: eventHistories.toList(),
                  areItemsTheSame: (a, b) => a.id == b.id,
                  padding: EdgeInsets.zero,
                  insertDuration: const Duration(milliseconds: 300),
                  removeDuration: const Duration(milliseconds: 300),
                  updateDuration: const Duration(milliseconds: 300),
                  itemBuilder: (context, animation, item, index) => SizeFadeTransition(
                    sizeFraction: 0.7,
                    curve: Curves.easeInOut,
                    animation: animation,
                    child: Column(
                      children: [
                        _EventItem(eventHistory: item),
                        const Divider(height: 1),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}

class _EventHistoryCaption extends StatelessWidget {
  const _EventHistoryCaption({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: Dimens.padding8),
        child: Row(
          children: [
            const SizedBox(width: Dimens.padding24),
            Text(
              AppLocalizations.string(context).eventEdit.historyCaption,
              style: Theme.of(context).textTheme.caption?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface.withOpacity(Dimens.emphasisLow),
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(width: Dimens.padding32),
          ],
        ),
      );
}

class _EventItem extends StatelessWidget {
  const _EventItem({
    required this.eventHistory,
    Key? key,
  }) : super(key: key);

  final EventHistory eventHistory;

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: () => EventEditController.of(context).onEventHistorySelected(eventHistory),
        child: IntrinsicHeight(
          child: Row(
            children: [
              const SizedBox(width: Dimens.padding32),
              ClipOval(
                child: Material(
                  color: eventHistory.color,
                  child: SizedBox.fromSize(
                    size: const Size.square(Dimens.viewSize12),
                  ),
                ),
              ),
              const SizedBox(width: Dimens.padding24),
              Expanded(
                child: Text(
                  eventHistory.name,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.caption!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onSurface.withOpacity(Dimens.emphasisMedium),
                      ),
                ),
              ),
              InkWell(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                hoverColor: Colors.transparent,
                focusColor: Colors.transparent,
                onTap: () => EventEditController.of(context).onEventHistoryDeleteButtonTap(eventHistory),
                borderRadius: const BorderRadius.all(Radius.circular(Dimens.radius32)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: Dimens.padding16, vertical: Dimens.padding16),
                  child: Center(
                    child: Icon(
                      FluentIcons.dismiss_24_filled,
                      size: 14,
                      color: Theme.of(context).colorScheme.onBackground.withOpacity(Dimens.emphasisLow),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: Dimens.padding16),
            ],
          ),
        ),
      );
}
