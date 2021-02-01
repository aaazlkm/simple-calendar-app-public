enum PreferenceKey {
  themeType,
  startDayOfWeek,
  prevSelectedColor,
  isFirstAppLaunch,
  alreadyReviewedApp,
  lastTimeDisplayedReviewDialog,
  reviewDialogDisplayCount,
  completedSettingForFirstLaunch,
  dailyReminderState,
  scheduledDailyRemindIds,
}

extension PreferenceKeyEx on PreferenceKey {
  String get name {
    switch (this) {
      case PreferenceKey.themeType:
        return 'themeType';
      case PreferenceKey.startDayOfWeek:
        return 'startDayOfWeek';
      case PreferenceKey.prevSelectedColor:
        return 'prevSelectedColor';
      case PreferenceKey.isFirstAppLaunch:
        return 'isFirstAppLaunch';
      case PreferenceKey.alreadyReviewedApp:
        return 'alreadyReviewedApp';
      case PreferenceKey.lastTimeDisplayedReviewDialog:
        return 'lastTimeDisplayedReviewDialog';
      case PreferenceKey.reviewDialogDisplayCount:
        return 'reviewDialogDisplayCount';
      case PreferenceKey.completedSettingForFirstLaunch:
        return 'completedSettingForFirstLaunch';
      case PreferenceKey.dailyReminderState:
        return 'dailyReminderState';
      case PreferenceKey.scheduledDailyRemindIds:
        return 'scheduledDailyRemindIds';
    }
  }
}
