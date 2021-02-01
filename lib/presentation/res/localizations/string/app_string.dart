import 'package:intl/intl.dart';
import 'package:review_dialog/review_dialog.dart';
import 'package:simple_app_kit/setting/res/setting_string.dart';
import 'package:simple_app_kit/simple_app_kit.dart';
import 'package:simple_calendar_app/domain/calendar/model/calendar/day_of_week.dart';

abstract class AppString with SyncString {
  EventEditString get eventEdit;

  NotificationString get notification;

  SettingString get setting;

  MultiDateString get multiDate;

  StartDayOfWeekModalString get startDayOfWeek;

  TimeOfDayModalString get timeOfDayModal;

  DeviceSettingDialogString get deviceSettingDialog;

  String get alertDialogOk;

  String get alertDialogDelete;

  String get alertDialogDeleteCancel;

  String get alertDialogCancel;

  String calendarDayOfWeekText(DayOfWeek dayOfWeek) => _dayOfWeekTextE(dayOfWeek);

  String calendarDayText(DateTime dateTime) => dateTime.day.toString();

  String get calendarFailedToFetchEvents;

  String get drawerItemSetting;

  String get drawerItemReviewApp;

  String get drawerItemOtherApp;

  String eventListDayTitleThisYear(DateTime day) => DateFormat.MMMMd().add_E().format(day);

  String eventListDayTitleNotThisYear(DateTime day) => DateFormat.yMMMMd().add_E().format(day);

  String eventListEventDateRange(DateTime start, DateTime end) => '${DateFormat.MMMd().format(start)} - ${DateFormat.MMMd().format(end)}';

  String eventListEventDateNotAllDay(DateTime start, DateTime end) => '${DateFormat.Hm().format(start)} - ${DateFormat.Hm().format(end)}';

  String get eventListNoEvents;

  String get eventListFailedToFetchEvents;

  String get holidayTitle;

  String get holidayListDescription;

  String get holidayListCaption;

  String get holidayListHowToRegister;

  String get holidayListEmptyTitle;

  String get holidayListEmptyDescription;

  String get holidayListEmptyHowToRegister;

  String get holidayPermissionTitle;

  String get holidayPermissionDescription;

  String get holidayPermissionPermitAccess;

  String get holidayFailedToFetchDeviceCalendar;

  String get holidayFailedToFetchHolidayDeviceCalendarId;

  IntroductionTextDelegate get introductionTextDelegate;

  ReviewDialogTextDelegate get reviewDialogTextDelegate;
}

abstract class SettingString extends SettingStringDelegate {
  String get sectionCalendar;

  String get itemStartDayOfWeek;

  String itemStartDayOfWeekLabel(DayOfWeek dayOfWeek) => _dayOfWeekTextE(dayOfWeek);

  String get itemHoliday;

  String startDayOfWeekPickerItem(DayOfWeek dayOfWeek) => _dayOfWeekTextEEEE(dayOfWeek);
}

mixin SyncString {
  String get syncFailedToSignIn;

  String get syncFailedToFetchBackupFile;

  String get syncSuccessToBackup;

  String get syncFailedToBackup;

  String get syncSuccessToRestore;

  String get syncFailedToRestore;

  String get syncFailedToDeleteBackup;

  String get syncSignOutConfirmationDialogTitle;

  String get syncCreateBackupConfirmationDialogTitle;

  String get syncRestoreConfirmationDialogTitle;

  String get syncDeleteConfirmationDialogTitle;

  String get syncPageTitle;

  String get syncAccountLogout;

  String get syncAccountLoginToMakeBackup;

  String get syncBackupListCaption;

  String get syncBackupListFailedToFetchMessage;

  String get syncBackupListRetryFetch;

  String get syncBackupListCreateBackup;

  String get syncBackupListEmptyTitle;

  String get syncBackupListEmptySubTitle;
}

abstract class EventEditString {
  String get nameHint;

  String get noteHint;

  String get historyCaption;

  String datePickerDayOfWeek(DayOfWeek dayOfWeek) => _dayOfWeekTextE(dayOfWeek);

  String get noDateSelected;

  String get timePickerStartCaption;

  String get timePickerEndCaption;

  String get addItemText;

  String get optionModalTitle;

  String get optionMultiDate;

  String get optionNote;

  String get failedToSave;

  String get failedToDelete;

  String get invalidName;

  String get invalidDate;

  String get confirmPopDialogTitle;

  String get confirmPopDialogButtonText;

  String confirmDeleteDialogTitle(String eventName);
}

abstract class NotificationString {
  String get updateDailyRemindStateFailed;

  String get dailyRemindTitle;

  String get dailyRemindDescription;

  String get dailyRemindTimeTitle;

  String get requestPermissionDialogTitle;

  String get requestPermissionDialogMessage;
}

abstract class MultiDateString {
  String get topControlTitle;

  String get cancelButtonText;

  String get selectButtonText;

  String calendarDayOfWeekText(DayOfWeek dayOfWeek) => _dayOfWeekTextE(dayOfWeek);
}

abstract class StartDayOfWeekModalString {
  String get title;
}

abstract class TimeOfDayModalString {
  String get topControlTitle;
}

abstract class DeviceSettingDialogString {
  String get title;

  String get setting;

  String get cancel;
}

/// 1969-7-20は日曜日なのでこれ基準で曜日を取得する
String _dayOfWeekTextE(DayOfWeek dayOfWeek) {
  final formatter = DateFormat.E();
  switch (dayOfWeek) {
    case DayOfWeek.sunday:
      return formatter.format(DateTime(1969, 7, 20));
    case DayOfWeek.monday:
      return formatter.format(DateTime(1969, 7, 21));
    case DayOfWeek.tuesday:
      return formatter.format(DateTime(1969, 7, 22));
    case DayOfWeek.wednesday:
      return formatter.format(DateTime(1969, 7, 23));
    case DayOfWeek.thursday:
      return formatter.format(DateTime(1969, 7, 24));
    case DayOfWeek.friday:
      return formatter.format(DateTime(1969, 7, 25));
    case DayOfWeek.saturday:
      return formatter.format(DateTime(1969, 7, 26));
  }
}

/// 1969-7-20は日曜日なのでこれ基準で曜日を取得する
String _dayOfWeekTextEEEE(DayOfWeek dayOfWeek) {
  final formatter = DateFormat.EEEE();
  switch (dayOfWeek) {
    case DayOfWeek.sunday:
      return formatter.format(DateTime(1969, 7, 20));
    case DayOfWeek.monday:
      return formatter.format(DateTime(1969, 7, 21));
    case DayOfWeek.tuesday:
      return formatter.format(DateTime(1969, 7, 22));
    case DayOfWeek.wednesday:
      return formatter.format(DateTime(1969, 7, 23));
    case DayOfWeek.thursday:
      return formatter.format(DateTime(1969, 7, 24));
    case DayOfWeek.friday:
      return formatter.format(DateTime(1969, 7, 25));
    case DayOfWeek.saturday:
      return formatter.format(DateTime(1969, 7, 26));
  }
}
