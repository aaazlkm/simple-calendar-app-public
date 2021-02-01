import 'package:review_dialog/review_dialog.dart';
import 'package:simple_app_kit/simple_app_kit.dart';
import 'package:simple_calendar_app/presentation/res/localizations/string/app_string.dart';

class AppStringJa extends AppString with _SyncStringJa {
  static const String languageCode = 'ja';

  @override
  EventEditString get eventEdit => _EventEditStringJa();

  @override
  NotificationString get notification => _NotificationStringJa();

  @override
  SettingString get setting => _SettingStringJa();

  @override
  MultiDateString get multiDate => _MultiDateStringJa();

  @override
  StartDayOfWeekModalString get startDayOfWeek => _StartDayOfWeekStringJa();

  @override
  TimeOfDayModalString get timeOfDayModal => _TimeOfDayModalStringJa();

  @override
  DeviceSettingDialogString get deviceSettingDialog => _DeviceSettingStringJa();

  @override
  String get alertDialogOk => 'OK';

  @override
  String get alertDialogCancel => 'Cancel';

  @override
  String get alertDialogDelete => '削除';

  @override
  String get alertDialogDeleteCancel => 'キャンセル';

  @override
  String get calendarFailedToFetchEvents => '予定の取得に失敗しました。';

  @override
  String get drawerItemSetting => '設定';

  @override
  String get drawerItemReviewApp => 'レビューして応援';

  @override
  String get drawerItemOtherApp => '他のアプリ';

  @override
  String get eventListNoEvents => '予定は存在しません';

  @override
  String get eventListFailedToFetchEvents => '予定の取得に失敗しました';

  @override
  String get holidayTitle => '祝日';

  @override
  String get holidayListDescription => '祝日のカレンダーを選択してください。\n選択したカレンダーは日付が赤色で表示されます。';

  @override
  String get holidayListCaption => '端末のカレンダー';

  @override
  String get holidayListHowToRegister => '他の祝日カレンダーの登録方法はこちら。';

  @override
  String get holidayListEmptyTitle => 'カレンダーが存在しません';

  @override
  String get holidayListEmptyDescription => '端末に登録されているカレンダーが存在しないため、祝日として使用するカレンダーを選択することができません。';

  @override
  String get holidayListEmptyHowToRegister => '登録方法はこちら';

  @override
  String get holidayPermissionTitle => 'カレンダー';

  @override
  String get holidayPermissionDescription => '祝日を表示するには、端末のカレンダーへのアクセスが必要です。';

  @override
  String get holidayPermissionPermitAccess => 'アクセスを許可する';

  @override
  String get holidayFailedToFetchDeviceCalendar => 'カレンダーの読み込みに失敗しました';

  @override
  String get holidayFailedToFetchHolidayDeviceCalendarId => '祝日の読み込みに失敗しました';

  @override
  IntroductionTextDelegate get introductionTextDelegate => JapaneseIntroductionTextDelegate();

  @override
  ReviewDialogTextDelegate get reviewDialogTextDelegate => const JapaneseReviewDialogTextDelegate();
}

class _SettingStringJa extends SettingString with SettingStringDelegateJa {
  @override
  String get sectionCalendar => 'カレンダー';

  @override
  String get itemStartDayOfWeek => '開始曜日';

  @override
  String get itemHoliday => '祝日';
}

mixin _SyncStringJa on SyncString {
  @override
  String get syncFailedToSignIn => 'ログインに失敗しました';

  @override
  String get syncFailedToFetchBackupFile => 'バックアップの取得に失敗しました';

  @override
  String get syncSuccessToBackup => 'バックアップに成功しました';

  @override
  String get syncFailedToBackup => 'バックアップが失敗しました';

  @override
  String get syncSuccessToRestore => 'データの復元に成功しました';

  @override
  String get syncFailedToRestore => 'データの復元に失敗しました';

  @override
  String get syncFailedToDeleteBackup => 'バックアップの削除に失敗しました';

  @override
  String get syncSignOutConfirmationDialogTitle => 'ログアウトしてもよろしいですか？';

  @override
  String get syncCreateBackupConfirmationDialogTitle => 'バックアップを作成しますか？';

  @override
  String get syncRestoreConfirmationDialogTitle => 'データの復元を行いますか？';

  @override
  String get syncDeleteConfirmationDialogTitle => 'バックアップを削除してもよろしいですか？';

  @override
  String get syncPageTitle => 'バックアップ';

  @override
  String get syncAccountLogout => 'ログアウト';

  @override
  String get syncAccountLoginToMakeBackup => 'ログインしてバックアップを行う';

  @override
  String get syncBackupListCaption => 'バックアップ';

  @override
  String get syncBackupListFailedToFetchMessage => 'バックアップの取得に失敗しました';

  @override
  String get syncBackupListRetryFetch => '再試行';

  @override
  String get syncBackupListCreateBackup => 'バックアップを作成する';

  @override
  String get syncBackupListEmptyTitle => 'バックアップが存在しません';

  @override
  String get syncBackupListEmptySubTitle => 'ボタンを押してバックアップを作成しましょう';
}

class _EventEditStringJa extends EventEditString {
  @override
  String get nameHint => 'タイトル';

  @override
  String get noteHint => 'メモ';

  @override
  String get historyCaption => '履歴';

  @override
  String get noDateSelected => '日付が選択されていません';

  @override
  String get addItemText => '項目を追加する';

  @override
  String get optionModalTitle => '追加する項目を選んでください';

  @override
  String get optionMultiDate => '複数日';

  @override
  String get optionNote => 'メモ';

  @override
  String get timePickerStartCaption => '開始';

  @override
  String get timePickerEndCaption => '終了';

  @override
  String get failedToSave => '予定の保存に失敗しました';

  @override
  String get failedToDelete => '予定の削除に失敗しました';

  @override
  String get invalidName => 'タイトルを入力してください';

  @override
  String get invalidDate => '開始時刻を終了時刻より後に設定することはできません';

  @override
  String get confirmPopDialogTitle => 'この予定に加えた変更を破棄してもよろしいですか？';

  @override
  String get confirmPopDialogButtonText => '破棄';

  @override
  String confirmDeleteDialogTitle(String eventName) => '「$eventName」を削除しますか？';
}

class _NotificationStringJa extends NotificationString {
  @override
  String get updateDailyRemindStateFailed => 'データの更新に失敗しました';

  @override
  String get dailyRemindTitle => '一日の予定通知';

  @override
  String get dailyRemindDescription => '毎日指定した時間に一日の予定を通知します';

  @override
  String get dailyRemindTimeTitle => '通知時間';

  @override
  String get requestPermissionDialogTitle => '通知が許可されていません';

  @override
  String get requestPermissionDialogMessage => '通知を受け取るために、設定画面で通知を許可してください';
}

class _MultiDateStringJa extends MultiDateString {
  @override
  String get topControlTitle => '追加する日付を選択してください';

  @override
  String get cancelButtonText => 'キャンセル';

  @override
  String get selectButtonText => '選択';
}

class _StartDayOfWeekStringJa extends StartDayOfWeekModalString {
  @override
  String get title => '開始曜日を選択してください';
}

class _TimeOfDayModalStringJa extends TimeOfDayModalString {
  @override
  String get topControlTitle => '通知する時間を選択してください';
}

class _DeviceSettingStringJa extends DeviceSettingDialogString {
  @override
  String get title => 'A設定アプリからアクセスを許可する必要があります';

  @override
  String get setting => '設定';

  @override
  String get cancel => 'キャンセル';
}
