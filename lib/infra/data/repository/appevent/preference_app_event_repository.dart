import 'package:simple_calendar_app/domain/appevent/gateway/app_event_repository.dart';
import 'package:simple_calendar_app/infra/data/preference/dao/app_event_preference_dao.dart';

class PreferenceAppEventRepository extends AppEventRepository {
  PreferenceAppEventRepository({required this.appEventPreferenceDao});

  final AppEventPreferenceDao appEventPreferenceDao;

  @override
  Future<bool?> getIsFirstAppLaunchOrNull() => appEventPreferenceDao.getIsFirstAppLaunchOrNull();

  @override
  Future<void> setIsFirstAppLaunch({required bool isFirstAppLaunch}) => appEventPreferenceDao.setIsFirstAppLaunch(isFirstAppLaunch: isFirstAppLaunch);

  @override
  Future<bool?> getAlreadyReviewedAppOrNull() => appEventPreferenceDao.getAlreadyReviewedAppOrNull();

  @override
  Future<void> setAlreadyReviewedApp({required bool alreadyReviewedApp}) => appEventPreferenceDao.setAlreadyReviewedApp(alreadyReviewedApp: alreadyReviewedApp);

  @override
  Future<int?> getLastTimeDisplayedReviewDialogOrNull() async => appEventPreferenceDao.getLastTimeDisplayedReviewDialogOrNull();

  @override
  Future<void> setLastTimeDisplayedReviewDialog(int lastTimeDisplayedReviewDialog) async => appEventPreferenceDao.setLastTimeDisplayedReviewDialog(lastTimeDisplayedReviewDialog);

  @override
  Future<int?> getReviewDialogDisplayCountOrNull() async => appEventPreferenceDao.getReviewDialogDisplayCountOrNull();

  @override
  Future<void> setReviewDialogDisplayCount(int displayCount) async => appEventPreferenceDao.setReviewDialogDisplayCount(displayCount);
}
