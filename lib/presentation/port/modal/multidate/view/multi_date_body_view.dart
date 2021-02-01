import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:nifu_flutter_kit/nifu_flutter_kit.dart';
import 'package:simple_calendar_app/presentation/port/modal/multidate/multi_date_picker.dart';
import 'package:simple_calendar_app/presentation/port/modal/multidate/multi_date_view_model.dart';
import 'package:simple_calendar_app/presentation/port/modal/multidate/view/calendar_pager_builder.dart';
import 'package:simple_calendar_app/presentation/res/localizations/app_localizations.dart';

class MultiDateBodyView extends StatelessWidget {
  const MultiDateBodyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: const [
          _CalendarYearMonthView(),
          Expanded(child: CalendarPagerBuilder()),
          SizedBox(height: Dimens.padding8),
          _BottomButtons(),
        ],
      );
}

class _CalendarYearMonthView extends StatelessWidget {
  const _CalendarYearMonthView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => StreamBuilder<DateTime>(
        stream: MultiDateViewModel.of(context).yearMonth,
        initialData: MultiDateViewModel.of(context).yearMonth.value,
        builder: (context, snapshot) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            snapshot.requireData.isSameYear(DateTime.now()) ? DateFormat.MMM().format(snapshot.requireData) : DateFormat.yMMM().format(snapshot.requireData),
            style: Theme.of(context).textTheme.subtitle2!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      );
}

class _BottomButtons extends StatelessWidget {
  const _BottomButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(
        height: Dimens.viewSize56,
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(Dimens.padding4),
                child: Material(
                  borderRadius: BorderRadius.circular(Dimens.radius8),
                  color: Theme.of(context).colorScheme.onSurface.withOpacity(0.08),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(Dimens.radius8),
                    onTap: () => MultiDateController.of(context).onCancelButtonTap(),
                    child: Center(
                      child: Text(
                        AppLocalizations.string(context).multiDate.cancelButtonText,
                        style: Theme.of(context).textTheme.caption!.copyWith(
                              color: Theme.of(context).colorScheme.onSurface.withOpacity(Dimens.emphasisLow),
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(Dimens.padding4),
                child: Material(
                  borderRadius: BorderRadius.circular(Dimens.radius8),
                  color: Color.alphaBlend(Theme.of(context).colorScheme.secondary.withOpacity(0.9), Theme.of(context).colorScheme.surface),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(Dimens.radius8),
                    onTap: () => MultiDateController.of(context).onSelectButtonTap(),
                    child: Center(
                      child: Text(
                        AppLocalizations.string(context).multiDate.selectButtonText,
                        style: Theme.of(context).textTheme.caption!.copyWith(
                              color: Theme.of(context).colorScheme.onSecondary.withOpacity(Dimens.emphasisHigh),
                              fontWeight: FontWeight.bold,
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
