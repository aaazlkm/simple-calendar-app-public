import 'package:get_it/get_it.dart';
import 'package:simple_calendar_app/domain/appevent/gateway/app_event_repository.dart';
import 'package:simple_calendar_app/domain/appevent/usecase/app_event_usecase.dart';
import 'package:simple_calendar_app/domain/calendar/gateway/calendar_repository.dart';
import 'package:simple_calendar_app/domain/calendar/gateway/database_repository.dart';
import 'package:simple_calendar_app/domain/calendar/gateway/event_history_repository.dart';
import 'package:simple_calendar_app/domain/calendar/gateway/holiday_device_calendar_repository.dart';
import 'package:simple_calendar_app/domain/calendar/usecase/calendar_usecase.dart';
import 'package:simple_calendar_app/domain/calendar/usecase/database_usecase.dart';
import 'package:simple_calendar_app/domain/calendar/usecase/event_history_usecase.dart';
import 'package:simple_calendar_app/domain/calendar/usecase/holiday_usecase.dart';
import 'package:simple_calendar_app/domain/notification/gateway/notification_gateway.dart';
import 'package:simple_calendar_app/domain/notification/gateway/notification_setting_repository.dart';
import 'package:simple_calendar_app/domain/notification/usecase/notification_use_case.dart';
import 'package:simple_calendar_app/domain/setting/gateway/setting_repository.dart';
import 'package:simple_calendar_app/domain/setting/usecase/setting_usecase.dart';
import 'package:simple_calendar_app/domain/sync/gateway/sync_file_gateway.dart';
import 'package:simple_calendar_app/domain/sync/gateway/sync_repository.dart';
import 'package:simple_calendar_app/domain/sync/usecsae/sync_use_case.dart';
import 'package:simple_calendar_app/infra/data/api/client/google_drive_api_client.dart';
import 'package:simple_calendar_app/infra/data/database/dao/calendar_dao.dart';
import 'package:simple_calendar_app/infra/data/database/dao/event_history_dao.dart';
import 'package:simple_calendar_app/infra/data/database/dao/holiday_device_calendar_dao.dart';
import 'package:simple_calendar_app/infra/data/file/storage/sync_file_storage.dart';
import 'package:simple_calendar_app/infra/data/preference/dao/app_event_preference_dao.dart';
import 'package:simple_calendar_app/infra/data/preference/dao/notification_preference_dao.dart';
import 'package:simple_calendar_app/infra/data/preference/dao/setting_preference_dao.dart';
import 'package:simple_calendar_app/infra/data/repository/appevent/preference_app_event_repository.dart';
import 'package:simple_calendar_app/infra/data/repository/calendar/database_calendar_repository.dart';
import 'package:simple_calendar_app/infra/data/repository/calendar/database_database_repository.dart';
import 'package:simple_calendar_app/infra/data/repository/calendar/database_event_history_repository.dart';
import 'package:simple_calendar_app/infra/data/repository/calendar/database_holiday_device_calendar_repository.dart';
import 'package:simple_calendar_app/infra/data/repository/notification/preference_notification_repository.dart';
import 'package:simple_calendar_app/infra/data/repository/setting/preference_setting_repository.dart';
import 'package:simple_calendar_app/infra/data/repository/sync/google_drive_sync_repository.dart';
import 'package:simple_calendar_app/infra/data/repository/sync/sync_file_gateway_impl.dart';
import 'package:simple_calendar_app/infra/device/notification/device_notification_gateway.dart';
import 'package:simple_calendar_app/presentation/pages/app/setting_store.dart';
import 'package:simple_calendar_app/presentation/pages/calendar/calendar_view_model.dart';
import 'package:simple_calendar_app/presentation/pages/event/edit/event_edit_view_model.dart';
import 'package:simple_calendar_app/presentation/pages/event/list/event_list_view_model.dart';
import 'package:simple_calendar_app/presentation/pages/holiday/holiday_view_model.dart';
import 'package:simple_calendar_app/presentation/pages/notification/notification_view_model.dart';
import 'package:simple_calendar_app/presentation/pages/setting/setting_view_model.dart';
import 'package:simple_calendar_app/presentation/pages/sync/sync_view_model.dart';
import 'package:simple_calendar_app/presentation/port/modal/multidate/multi_date_view_model.dart';
import 'package:simple_calendar_app/presentation/port/modal/timeofday/time_of_day_view_model.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  _setupLocatorInDevice();
  _setupLocatorInInfra();
  _setupLocatorInDomain();
  _setupLocatorInPresentation();
}

void _setupLocatorInDevice() {
  locator.registerFactory<NotificationGateway>(
    () => DeviceNotificationGateWay(),
  );
}

void _setupLocatorInInfra() {
  locator
    ..registerFactory<GoogleDriveApiClient>(
      () => GoogleDriveApiClient(),
    )
    ..registerFactory<CalendarDao>(
      () => CalendarDao(),
    )
    ..registerFactory<EventHistoryDao>(
      () => EventHistoryDao(),
    )
    ..registerFactory<SyncFileStorage>(
      () => SyncFileStorage(),
    )
    ..registerFactory<HolidayDeviceCalendarDao>(
      () => HolidayDeviceCalendarDao(),
    )
    ..registerFactory<AppEventPreferenceDao>(
      () => AppEventPreferenceDao(),
    )
    ..registerFactory<SettingPreferenceDao>(
      () => SettingPreferenceDao(),
    )
    ..registerFactory<NotificationPreferenceDao>(
      () => NotificationPreferenceDao(),
    )
    ..registerFactory<AppEventRepository>(
      () => PreferenceAppEventRepository(appEventPreferenceDao: locator.get<AppEventPreferenceDao>()),
    )
    ..registerFactory<CalendarRepository>(
      () => CalendarRepositoryImpl(
        calendarDao: locator.get<CalendarDao>(),
      ),
    )
    ..registerFactory<NotificationSettingRepository>(
      () => PreferenceNotificationSettingRepository(locator.get<NotificationPreferenceDao>()),
    )
    ..registerFactory<DatabaseRepository>(
      () => DatabaseDatabaseRepository(),
    )
    ..registerFactory<EventHistoryRepository>(
      () => DatabaseEventHistoryRepository(
        eventHistoryDao: locator.get<EventHistoryDao>(),
      ),
    )
    ..registerFactory<HolidayDeviceCalendarRepository>(
      () => DatabaseHolidayDeviceCalendarRepository(
        holidayDeviceCalendarDao: locator.get<HolidayDeviceCalendarDao>(),
      ),
    )
    ..registerFactory<SettingRepository>(
      () => PreferenceSettingRepository(locator.get<SettingPreferenceDao>()),
    )
    ..registerFactory<SyncRepository>(
      () => GoogleDriveSyncRepository(locator.get<GoogleDriveApiClient>()),
    )
    ..registerFactory<SyncFileGateway>(
      () => SyncFileGatewayImpl(locator.get<SyncFileStorage>()),
    );
}

void _setupLocatorInDomain() {
  locator
    ..registerFactory<CalendarUseCase>(
      () => CalendarUseCase(
        calendarRepository: locator.get<CalendarRepository>(),
        eventHistoryUseCase: locator.get<EventHistoryUseCase>(),
      ),
    )
    ..registerFactory<NotificationUseCase>(
      () => NotificationUseCase(
        locator.get<NotificationGateway>(),
        locator.get<NotificationSettingRepository>(),
        locator.get<CalendarRepository>(),
      ),
    )
    ..registerFactory<DatabaseUseCase>(
      () => DatabaseUseCase(
        databaseRepository: locator.get<DatabaseRepository>(),
      ),
    )
    ..registerFactory<EventHistoryUseCase>(
      () => EventHistoryUseCase(
        eventHistoryRepository: locator.get<EventHistoryRepository>(),
      ),
    )
    ..registerFactory<HolidayUseCase>(
      () => HolidayUseCase(
        holidayDeviceCalendarRepository: locator.get<HolidayDeviceCalendarRepository>(),
      ),
    )
    ..registerFactory<AppEventUseCase>(
      () => AppEventUseCase(
        appEventRepository: locator.get<AppEventRepository>(),
        calendarRepository: locator.get<CalendarRepository>(),
      ),
    )
    ..registerFactory<SettingUseCase>(
      () => SettingUseCase(
        settingRepository: locator.get<SettingRepository>(),
      ),
    )
    ..registerFactory<SyncUseCase>(
      () => SyncUseCase(
        locator.get<SyncRepository>(),
        locator.get<SyncFileGateway>(),
        locator.get<CalendarRepository>(),
        locator.get<NotificationUseCase>(),
      ),
    );
}

void _setupLocatorInPresentation() {
  locator
    ..registerFactory<SettingStore>(
      () => SettingStore(
        locator.get<SettingUseCase>(),
      ),
    )
    ..registerFactory<CalendarViewModel>(
      () => CalendarViewModel(
        calendarUseCase: locator.get<CalendarUseCase>(),
        holidayUseCase: locator.get<HolidayUseCase>(),
        settingUseCase: locator.get<SettingUseCase>(),
        appEventUseCase: locator.get<AppEventUseCase>(),
      ),
    )
    ..registerFactory<EventEditViewModel>(
      () => EventEditViewModel(
        calendarUseCase: locator.get<CalendarUseCase>(),
        eventHistoryUseCase: locator.get<EventHistoryUseCase>(),
        settingUseCase: locator.get<SettingUseCase>(),
      ),
    )
    ..registerFactory<EventListViewModel>(
      () => EventListViewModel(
        calendarUseCase: locator.get<CalendarUseCase>(),
        holidayUseCase: locator.get<HolidayUseCase>(),
      ),
    )
    ..registerFactory<HolidayViewModel>(
      () => HolidayViewModel(
        holidayUseCase: locator.get<HolidayUseCase>(),
      ),
    )
    ..registerFactory<NotificationViewModel>(
      () => NotificationViewModel(locator.get<NotificationUseCase>()),
    )
    ..registerFactory<SettingViewModel>(
      () => SettingViewModel(
        settingUseCase: locator.get<SettingUseCase>(),
        notificationUseCase: locator.get<NotificationUseCase>(),
      ),
    )
    ..registerFactory<SyncViewModel>(
      () => SyncViewModel(locator.get<SyncUseCase>()),
    )
    ..registerFactory<MultiDateViewModel>(
      () => MultiDateViewModel(locator.get<SettingUseCase>()),
    )
    ..registerFactory<TimeOfDayViewModel>(
      () => TimeOfDayViewModel(),
    );
}
