import 'package:result/result.dart';
import 'package:simple_calendar_app/core/constant.dart';
import 'package:simple_calendar_app/domain/appevent/gateway/app_event_repository.dart';
import 'package:simple_calendar_app/domain/calendar/gateway/calendar_repository.dart';

class AppEventUseCase {
  AppEventUseCase({
    required this.appEventRepository,
    required this.calendarRepository,
  });

  final AppEventRepository appEventRepository;

  final CalendarRepository calendarRepository;

  Future<Result<Complete>> recordAppHasLaunched() => appEventRepository.setIsFirstAppLaunch(isFirstAppLaunch: false).toComplete();

  Future<Result<bool>> needToDisplayReviewDialog() => Future(() async {
        final eventsSize = await calendarRepository.fetchAllEvents().then((events) => events.length);
        final lastTimeDisplayedReviewDialog = await appEventRepository.getLastTimeDisplayedReviewDialogOrNull() ?? 0;
        final reviewDialogDisplayCount = await appEventRepository.getReviewDialogDisplayCountOrNull() ?? 0;

        /// in app reviewが利用可能な場合、getAlreadyReviewedAppと実際にレビューしたかどうかの値は同期しないことに注意
        final alreadyReviewedApp = await appEventRepository.getAlreadyReviewedAppOrNull() ?? false;
        final meetEventSizeTerms = eventsSize > Constant.eventSizeTermsToReviewDialog;
        final meetIntervalTerms = DateTime.now().millisecondsSinceEpoch - lastTimeDisplayedReviewDialog > Constant.intervalTermsToReviewDialog;
        final meetDisplayCountTerms = reviewDialogDisplayCount < Constant.displayCountTermsToReviewDialog;
        return !alreadyReviewedApp && meetEventSizeTerms && meetIntervalTerms && meetDisplayCountTerms;
      }).toResult();

  Future<Result<Complete>> recordUserReviewedApp() => appEventRepository.setAlreadyReviewedApp(alreadyReviewedApp: true).toComplete();

  Future<Result<Complete>> recordReviewDialogDisplayed() => Future(() async {
        await appEventRepository.setLastTimeDisplayedReviewDialog(DateTime.now().millisecondsSinceEpoch);
        final displayCount = await appEventRepository.getReviewDialogDisplayCountOrNull() ?? 0;
        await appEventRepository.setReviewDialogDisplayCount(displayCount + 1);
      }).toComplete();
}
