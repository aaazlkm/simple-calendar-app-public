import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:implicitly_animated_reorderable_list/implicitly_animated_reorderable_list.dart';
import 'package:implicitly_animated_reorderable_list/transitions.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:nifu_flutter_kit/resources/dimens.dart';
import 'package:simple_app_kit/simple_app_kit.dart';
import 'package:simple_calendar_app/presentation/pages/holiday/holiday_controller.dart';
import 'package:simple_calendar_app/presentation/pages/holiday/model/calendar_list_item.dart';
import 'package:simple_calendar_app/presentation/res/localizations/app_localizations.dart';
import 'package:simple_calendar_app/presentation/widget/round_check_box.dart';

class CalendarListView extends StatelessWidget {
  const CalendarListView({
    required this.deviceCalendars,
    Key? key,
  }) : super(key: key);

  static const horizontalPadding = Dimens.padding24;

  final BuiltList<CalendarListItem> deviceCalendars;

  @override
  Widget build(BuildContext context) => ListView(
        controller: ModalScrollController.of(context),
        children: [
          const SizedBox(height: Dimens.padding24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: horizontalPadding + Dimens.padding8),
            child: Text(
              AppLocalizations.string(context).holidayListCaption,
              style: Theme.of(context).textTheme.caption?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface.withOpacity(Dimens.emphasisHigh),
                    fontSize: Dimens.fontSize12,
                    // fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          const SizedBox(height: Dimens.padding8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Material(
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(Dimens.radius8))),
              color: Theme.of(context).colorScheme.surface,
              child: ImplicitlyAnimatedList<CalendarListItem>(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                padding: EdgeInsets.zero,
                items: deviceCalendars.toList(),
                areItemsTheSame: (a, b) => a.deviceCalendar.id == b.deviceCalendar.id,
                itemBuilder: (context, animation, item, index) => SizeFadeTransition(
                  sizeFraction: 0.7,
                  curve: Curves.easeInOut,
                  animation: animation,
                  child: _CalendarListItemView(key: ValueKey(item.deviceCalendar.id), item: item),
                ),
              ),
            ),
          ),
          const SizedBox(height: Dimens.padding8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: horizontalPadding + Dimens.padding8),
            child: Text(
              AppLocalizations.string(context).holidayListDescription,
              style: Theme.of(context).textTheme.caption?.copyWith(
                    fontSize: Dimens.fontSize12,
                    color: Theme.of(context).colorScheme.onSurface.withOpacity(Dimens.emphasisHigh),
                  ),
            ),
          ),
          InkWell(
            onTap: () => HolidayController.of(context).onHowToRegisterButtonOnListTap(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: horizontalPadding + Dimens.padding8, vertical: Dimens.padding8),
              child: Text(
                AppLocalizations.string(context).holidayListHowToRegister,
                style: Theme.of(context).textTheme.caption?.copyWith(
                      fontSize: Dimens.fontSize12,
                      color: Colors.blue[700],
                    ),
              ),
            ),
          ),
          const SizedBox(height: Dimens.padding96),
        ],
      );
}

class _CalendarListItemView extends StatelessWidget {
  const _CalendarListItemView({
    required this.item,
    Key? key,
  }) : super(key: key);

  final CalendarListItem item;

  @override
  Widget build(BuildContext context) => InkWell(
        borderRadius: SettingSectionCard.borderRadius,
        onTap: () => HolidayController.of(context).onDeviceCalendarTap(item.deviceCalendar),
        child: Row(
          children: [
            const SizedBox(width: Dimens.padding20),
            ClipOval(
              child: ColoredBox(
                color: item.deviceCalendar.color,
                child: SizedBox.fromSize(
                  size: const Size.square(Dimens.viewSize16),
                ),
              ),
            ),
            const SizedBox(width: Dimens.padding16),
            Text(
              item.deviceCalendar.name,
              style: Theme.of(context).textTheme.subtitle2!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            const Spacer(),
            CustomCheckbox(
              activeColor: Theme.of(context).colorScheme.secondary,
              checkColor: Theme.of(context).colorScheme.onSecondary.withOpacity(Dimens.emphasisHigh),
              value: item.isSelected,
              onChanged: (checked) => HolidayController.of(context).onCheckBoxTap(item.deviceCalendar),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(300)),
            ),
            const SizedBox(width: Dimens.padding8),
          ],
        ),
      );
}
