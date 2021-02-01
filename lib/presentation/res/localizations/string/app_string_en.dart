import 'package:review_dialog/review_dialog.dart';
import 'package:simple_app_kit/setting/res/setting_string.dart';
import 'package:simple_app_kit/simple_app_kit.dart';
import 'package:simple_calendar_app/presentation/res/localizations/string/app_string.dart';

class AppStringEn extends AppString with _SyncStringEn {
  static const String languageCode = 'en';

  @override
  EventEditString get eventEdit => _EventEditStringEn();

  @override
  NotificationString get notification => _NotificationStringEn();

  @override
  SettingString get setting => _SettingStringEn();

  @override
  MultiDateString get multiDate => _MultiDateStringEn();

  @override
  StartDayOfWeekModalString get startDayOfWeek => _StartDayOfWeekStringEn();

  @override
  TimeOfDayModalString get timeOfDayModal => _TimeOfDayModalStringEn();

  @override
  DeviceSettingDialogString get deviceSettingDialog => _DeviceSettingStringEn();

  @override
  String get alertDialogOk => 'OK';

  @override
  String get alertDialogCancel => 'Cancel';

  @override
  String get alertDialogDelete => 'Delete';

  @override
  String get alertDialogDeleteCancel => alertDialogCancel;

  @override
  String get calendarFailedToFetchEvents => 'Failed to get events.';

  @override
  String get drawerItemSetting => 'Setting';

  @override
  String get drawerItemReviewApp => 'Review app';

  @override
  String get drawerItemOtherApp => 'Other apps';

  @override
  String get eventListNoEvents => 'There is no event';

  @override
  String get eventListFailedToFetchEvents => 'Failed to fetch events.';

  @override
  String get holidayTitle => 'Holiday';

  @override
  String get holidayListDescription => 'Select the calendar for the holiday.\nThe selected calendar will show the date in red.';

  @override
  String get holidayListCaption => 'device calendar';

  @override
  String get holidayListHowToRegister => 'Click here how to register another holiday calendar.';

  @override
  String get holidayListEmptyTitle => 'Calendar does not exist...';

  @override
  String get holidayListEmptyDescription => 'The calendar registered in the device does not exist, so you cannot select a calendar to use as a holiday.';

  @override
  String get holidayListEmptyHowToRegister => 'Click here how to register.';

  @override
  String get holidayPermissionTitle => 'Calendar';

  @override
  String get holidayPermissionDescription => 'To display holidays, you need to allow access to your calendar.';

  @override
  String get holidayPermissionPermitAccess => 'Allow';

  @override
  String get holidayFailedToFetchDeviceCalendar => 'Failed to load device calendar';

  @override
  String get holidayFailedToFetchHolidayDeviceCalendarId => 'Failed to load holiday';

  @override
  IntroductionTextDelegate get introductionTextDelegate => EnglishIntroductionTextDelegate();

  @override
  ReviewDialogTextDelegate get reviewDialogTextDelegate => const EnglishReviewDialogTextDelegate();
}

class _SettingStringEn extends SettingString with SettingStringDelegateEn {
  @override
  String get sectionCalendar => 'Calendar';

  @override
  String get itemStartDayOfWeek => 'Start day of week';

  @override
  String get itemHoliday => 'Holiday';
}

mixin _SyncStringEn on SyncString {
  @override
  String get syncFailedToSignIn => 'Failed to log in.';

  @override
  String get syncFailedToFetchBackupFile => 'Failed to get backup files.';

  @override
  String get syncSuccessToBackup => 'Backup successfully completed.';

  @override
  String get syncFailedToBackup => 'Failed to backup.';

  @override
  String get syncSuccessToRestore => 'Data restoration succeeded.';

  @override
  String get syncFailedToRestore => 'Failed to restore data.';

  @override
  String get syncFailedToDeleteBackup => 'Failed to delete backup.';

  @override
  String get syncSignOutConfirmationDialogTitle => 'Are you sure you want to log out?';

  @override
  String get syncCreateBackupConfirmationDialogTitle => 'Do you want to create a backup?';

  @override
  String get syncRestoreConfirmationDialogTitle => 'Do you want to restore data?';

  @override
  String get syncDeleteConfirmationDialogTitle => 'Are you sure you want to delete the backup data?';

  @override
  String get syncPageTitle => 'Backup / Restore';

  @override
  String get syncAccountLogout => 'Log out';

  @override
  String get syncAccountLoginToMakeBackup => 'Log in to make backup';

  @override
  String get syncBackupListCaption => 'Backup data';

  @override
  String get syncBackupListFailedToFetchMessage => 'Failed to get backup.';

  @override
  String get syncBackupListRetryFetch => 'Retry';

  @override
  String get syncBackupListCreateBackup => 'Create backup file';

  @override
  String get syncBackupListEmptyTitle => 'There is no backup files.';

  @override
  String get syncBackupListEmptySubTitle => 'Press the button to create a backup!';
}

class _EventEditStringEn extends EventEditString {
  @override
  String get nameHint => 'Title';

  @override
  String get noteHint => 'Notes';

  @override
  String get historyCaption => 'History';

  @override
  String get noDateSelected => 'No date selected';

  @override
  String get timePickerStartCaption => 'Start';

  @override
  String get timePickerEndCaption => 'End';

  @override
  String get addItemText => 'Add items';

  @override
  String get optionModalTitle => 'Select item you want to add';

  @override
  String get optionMultiDate => 'Multi dates';

  @override
  String get optionNote => 'Note';

  @override
  String get failedToSave => 'Failed to save event';

  @override
  String get failedToDelete => 'Failed to delete event';

  @override
  String get invalidName => 'Please input event name.';

  @override
  String get invalidDate => 'The start date must be before the end date.';

  @override
  String get confirmPopDialogTitle => 'Are you sure you want to discard changes to this event？';

  @override
  String get confirmPopDialogButtonText => 'Discard';

  @override
  String confirmDeleteDialogTitle(String eventName) => 'Are you sure you want to delete 「$eventName」？';
}

class _NotificationStringEn extends NotificationString {
  @override
  String get updateDailyRemindStateFailed => 'Failed to update data.';

  @override
  String get dailyRemindTitle => 'Daily events notification';

  @override
  String get dailyRemindDescription => "Notify the day's events at the specified time every day";

  @override
  String get dailyRemindTimeTitle => 'Notification time';

  @override
  String get requestPermissionDialogTitle => 'Notifications are not allowed';

  @override
  String get requestPermissionDialogMessage => 'Please allow notifications in your settings to receive notifications';
}

class _MultiDateStringEn extends MultiDateString {
  @override
  String get topControlTitle => 'Select the date you want to add';

  @override
  String get cancelButtonText => 'Cancel';

  @override
  String get selectButtonText => 'Select';
}

class _StartDayOfWeekStringEn extends StartDayOfWeekModalString {
  @override
  String get title => 'Select start day of week.';
}

class _TimeOfDayModalStringEn extends TimeOfDayModalString {
  @override
  String get topControlTitle => 'Select notification time';
}

class _DeviceSettingStringEn extends DeviceSettingDialogString {
  @override
  String get title => 'Access must be granted through the Setting app';

  @override
  String get setting => 'Setting';

  @override
  String get cancel => 'Cancel';
}
