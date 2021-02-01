import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:simple_calendar_app/domain/calendar/model/event/event.dart';
import 'package:simple_calendar_app/locator/locator.dart';
import 'package:simple_calendar_app/presentation/navigator/app_navigator.dart';
import 'package:simple_calendar_app/presentation/pages/event/edit/trade/event_edit_argument.dart';
import 'package:simple_calendar_app/presentation/pages/event/list/controller/event_list_pager_cotroller.dart';
import 'package:simple_calendar_app/presentation/pages/event/list/event_list_view_model.dart';
import 'package:simple_calendar_app/presentation/pages/event/list/trade/event_list_argument.dart';
import 'package:simple_calendar_app/presentation/pages/event/list/view/event_list_page_view.dart';
import 'package:simple_calendar_app/presentation/port/toast.dart';
import 'package:simple_calendar_app/presentation/res/localizations/app_localizations.dart';

class EventListPage extends StatefulWidget {
  const EventListPage({required this.argument, Key? key}) : super(key: key);

  final EventListArgument argument;

  @override
  _EventListPageState createState() => _EventListPageState();
}

class _EventListPageState extends State<EventListPage> with EventListController {
  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          Provider<EventListController>.value(value: this),
          Provider<EventListViewModelData>.value(value: _viewModel),
          Provider<EventListPagerController>.value(value: _eventListPagerController),
        ],
        child: const EventListPageView(),
      );
}

mixin EventListController on State<EventListPage> {
  static EventListController of(BuildContext context) => context.read<EventListController>();

  final CompositeSubscription compositeSubscription = CompositeSubscription();
  late final EventListViewModel _viewModel;
  late final EventListPagerController _eventListPagerController;

  @override
  void initState() {
    super.initState();
    _viewModel = locator.get<EventListViewModel>()..setup(widget.argument);
    _eventListPagerController = EventListPagerController(initialDay: _viewModel.nowDayValue);
    _bindViewModelEvent();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    _eventListPagerController.dispose();
    compositeSubscription.clear();
    super.dispose();
  }

  void _bindViewModelEvent() {
    _viewModel.failedToFetchEvent.listen((result) {
      showToast(message: AppLocalizations.string(context).eventListFailedToFetchEvents);
    }).addTo(compositeSubscription);
  }

  void onOverlayTap() {
    AppNavigator.of(context).popEventListPage(context);
  }

  void onCloseButtonTap() {
    AppNavigator.of(context).popEventListPage(context);
  }

  void onDayChanged(DateTime day) {
    _viewModel.updateNowDay(day);
  }

  void onEventTap(Event event) {
    _pushToEventEditScreen(
      argument: EventEditArgument.edit(
        calendar: _viewModel.calendarValue,
        event: event,
      ),
    );
  }

  void onFloatingActionButtonTap() {
    _pushToEventEditScreen(
      argument: EventEditArgument.newItem(
        calendar: _viewModel.calendarValue,
        dateTime: _viewModel.nowDayValue,
      ),
    );
  }

  Future<void> _pushToEventEditScreen({required EventEditArgument argument}) async {
    await AppNavigator.of(context).pushEventEditPage(
      context: context,
      argument: argument,
    );
    // 画面に戻ってからリストのアニメーションを反映させるためにdelayedさせる
    await Future<void>.delayed(const Duration(milliseconds: 200));
    await _viewModel.fetchAllEvents();
  }
}
