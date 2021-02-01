abstract class AppEventRepository {
  Future<bool?> getIsFirstAppLaunchOrNull();

  Future<void> setIsFirstAppLaunch({required bool isFirstAppLaunch});

  Future<bool?> getAlreadyReviewedAppOrNull();

  Future<void> setAlreadyReviewedApp({required bool alreadyReviewedApp});

  Future<int?> getLastTimeDisplayedReviewDialogOrNull();

  Future<void> setLastTimeDisplayedReviewDialog(int lastTimeDisplayedReviewDialog);

  Future<int?> getReviewDialogDisplayCountOrNull();

  Future<void> setReviewDialogDisplayCount(int displayCount);
}
