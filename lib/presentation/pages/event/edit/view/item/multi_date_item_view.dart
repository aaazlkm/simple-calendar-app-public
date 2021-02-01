import 'dart:math' as math;

import 'package:built_collection/built_collection.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:nifu_flutter_kit/nifu_flutter_kit.dart';
import 'package:nifu_flutter_kit/resources/dimens.dart';
import 'package:simple_calendar_app/domain/calendar/model/event/event_date.dart';
import 'package:simple_calendar_app/presentation/pages/event/edit/event_edit_page.dart';
import 'package:simple_calendar_app/presentation/res/localizations/app_localizations.dart';

class MultiDateItemView extends StatelessWidget {
  const MultiDateItemView({
    required this.eventDates,
    Key? key,
  }) : super(key: key);

  static const maxVisibleItem = 4;

  final BuiltList<EventDate> eventDates;

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: () => EventEditController.of(context).onMultiDateItemTap(),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: Dimens.padding4),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(width: Dimens.padding24),
              Padding(
                padding: const EdgeInsets.only(top: Dimens.padding12),
                child: Icon(
                  FluentIcons.calendar_multiple_20_regular,
                  color: Theme.of(context).colorScheme.onBackground.withOpacity(Dimens.emphasisLow),
                ),
              ),
              const SizedBox(width: Dimens.padding16), // itemの要素がpaddingを持ってるため24より小さい値になってる
              Expanded(
                child: Stack(
                  children: [
                    AnimatedVisibility(
                      visible: eventDates.isNotEmpty,
                      duration: const Duration(milliseconds: 400),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: Dimens.padding12),
                        child: Wrap(
                          spacing: Dimens.padding8,
                          runSpacing: 6,
                          children: [
                            ...eventDates
                                .sublist(0, math.min(maxVisibleItem, eventDates.length))
                                .map(
                                  (eventDate) => _EventDateItem(eventDate: eventDate),
                                )
                                .toList(),
                            Visibility(
                              visible: eventDates.length > maxVisibleItem,
                              child: _buildRemainderCount(context),
                            ),
                          ],
                        ),
                      ),
                    ),
                    AnimatedVisibility(
                      visible: eventDates.isEmpty,
                      duration: const Duration(milliseconds: 400),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: Dimens.padding12).copyWith(top: 14), // 中心からずれているので
                        child: Row(
                          children: [
                            const SizedBox(width: Dimens.padding6),
                            Expanded(
                              child: Text(
                                AppLocalizations.string(context).eventEdit.noDateSelected,
                                style: Theme.of(context).textTheme.caption!.copyWith(
                                      color: Theme.of(context).colorScheme.onSurface.withOpacity(Dimens.emphasisLow),
                                    ),
                              ),
                            ),
                            const SizedBox(width: Dimens.padding6),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              InkResponse(
                onTap: () => EventEditController.of(context).onMultiDateItemDismissButtonTap(),
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
        ),
      );

  Material _buildRemainderCount(BuildContext context) => Material(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(Dimens.radius16),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Dimens.padding12, vertical: Dimens.padding4),
          child: Text(
            '+ ${eventDates.length - maxVisibleItem}',
            style: Theme.of(context).textTheme.caption,
          ),
        ),
      );
}

class _EventDateItem extends StatelessWidget {
  const _EventDateItem({
    required this.eventDate,
    Key? key,
  }) : super(key: key);

  final EventDate eventDate;

  @override
  Widget build(BuildContext context) => Material(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(Dimens.radius16),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Dimens.padding8, vertical: Dimens.padding4),
          child: DefaultTextStyle(
            style: Theme.of(context).textTheme.caption!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Text(
                    DateFormat.yMMMMd().format(eventDate.start),
                    maxLines: 1,
                  ),
                ),
                Visibility(
                  visible: eventDate.isRange,
                  child: Row(
                    children: [
                      const SizedBox(width: Dimens.padding8),
                      const Text('~'),
                      const SizedBox(width: Dimens.padding8),
                      Text(DateFormat.yMMMMd().format(eventDate.end)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
