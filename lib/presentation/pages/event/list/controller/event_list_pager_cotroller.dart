import 'package:flutter/widgets.dart';
import 'package:nifu_flutter_kit/nifu_flutter_kit.dart';
import 'package:provider/provider.dart';
import 'package:simple_calendar_app/presentation/pages/event/list/view/day_view.dart';

class EventListPagerController {
  EventListPagerController({required DateTime initialDay})
      : _pageController = PageController(
          initialPage: calculatePageIndexFromDay(day: initialDay),
          viewportFraction: DayView.viewportWidthFraction,
        );

  static EventListPagerController of(BuildContext context) => context.read<EventListPagerController>();

  /// 100年分
  static int pageCount = 365 * 100;

  static int originPageIndex = pageCount ~/ 2;

  static DateTime originDay = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

  static DateTime calculateDayFromPageIndex({required int pageIndex}) => originDay.addDate(day: pageIndex - originPageIndex);

  static int calculatePageIndexFromDay({required DateTime day}) => day.startDayTime.difference(originDay.startDayTime).inDays + originPageIndex;

  final PageController _pageController;

  PageController get pageController => _pageController;

  void dispose() {
    _pageController.dispose();
  }
}
