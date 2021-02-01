import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nifu_flutter_kit/nifu_flutter_kit.dart';
import 'package:provider/provider.dart';

class YearMonthPickerController {
  YearMonthPickerController({required DateTime initialYear})
      : _pageController = PageController(
          initialPage: calculatePageIndexFromYear(initialYear),
        );

  static YearMonthPickerController of(BuildContext context) => context.read<YearMonthPickerController>();

  /// 100年分
  /// Unix epochを考慮してる
  static int pageCount = 100;

  static int originPageIndex = pageCount ~/ 2;

  static DateTime originYear = DateTime.now();

  static DateTime calculateYearFromPageIndex(int pageIndex) => originYear.addDate(year: pageIndex - originPageIndex);

  static int calculatePageIndexFromYear(DateTime year) => year.year - originYear.year + originPageIndex;

  final PageController _pageController;

  PageController get pageController => _pageController;

  void nextPageWithAnimation() {
    pageController.nextPage(duration: kThemeAnimationDuration, curve: Curves.easeInOutSine);
  }

  void previousPageWithAnimation() {
    pageController.previousPage(duration: kThemeAnimationDuration, curve: Curves.easeInOutSine);
  }

  void dispose() {
    _pageController.dispose();
  }
}
