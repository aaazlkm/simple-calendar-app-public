import 'package:flutter/widgets.dart';
import 'package:nifu_flutter_kit/nifu_flutter_kit.dart';
import 'package:provider/provider.dart';

class DatePickerPageController {
  DatePickerPageController({required DateTime initialYearMonth})
      : _pageController = PageController(
          initialPage: calculatePageIndexFromYearMonth(initialYearMonth),
        );

  static DatePickerPageController of(BuildContext context) => context.read<DatePickerPageController>();

  /// 100年分
  /// Unix epochを考慮してる
  static int pageCount = 1200;

  static int originPageIndex = pageCount ~/ 2;

  static DateTime originYearMonth = DateTime(DateTime.now().year, DateTime.now().month);

  static DateTime calculateYearMonthFromPageIndex(int pageIndex) => originYearMonth.addDate(month: pageIndex - originPageIndex);

  static int calculatePageIndexFromYearMonth(DateTime yearMonth) =>
      yearMonth.year * DateTime.monthsPerYear + yearMonth.month - originYearMonth.year * DateTime.monthsPerYear - originYearMonth.month + originPageIndex;

  final PageController _pageController;

  PageController get pageController => _pageController;

  void animateToYearMonthPageIfNeeded(DateTime dateTime) {
    if (!pageController.hasClients) {
      return;
    }
    final pageIndex = calculatePageIndexFromYearMonth(dateTime);
    if (pageController.page?.toInt() != pageIndex) {
      pageController.animateToPage(
        pageIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void dispose() {
    _pageController.dispose();
  }
}
