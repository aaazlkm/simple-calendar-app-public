import 'package:flutter/material.dart';
import 'package:simple_calendar_app/domain/exception/app_exception.dart';
import 'package:simple_calendar_app/domain/notification/model/daily_remind_id.dart';
import 'package:simple_calendar_app/domain/notification/model/daily_remind_time.dart';
import 'package:simple_calendar_app/domain/notification/model/daily_remind_type.dart';
import 'package:simple_calendar_app/domain/notification/model/daily_reminder_state.dart';
import 'package:simple_calendar_app/infra/data/preference/model/daily_reminder_state_data.dart';

class DailyReminderStateMapper {
  static DailyReminderState fromData(DailyReminderStateData data) => DailyReminderState(
        enable: _fromDataState(data.state),
        remindTime: DailyRemindTime(
          remindType: _fromDataRemindType(data.remindType),
          timeOfDay: TimeOfDay(hour: data.hour, minute: data.minute),
        ),
      );

  static DailyReminderStateData toData(DailyReminderState dailyReminderState) => DailyReminderStateData(
        state: _toState(dailyReminderState.enable),
        remindType: _toRemindType(dailyReminderState.remindTime.remindType),
        hour: dailyReminderState.remindTime.timeOfDay.hour,
        minute: dailyReminderState.remindTime.timeOfDay.minute,
      );

  static bool _fromDataState(int state) {
    switch (state) {
      case DailyReminderStateData.stateDataWhenEnable:
        return true;
      case DailyReminderStateData.stateDataWhenDisable:
        return false;
    }
    throw InvalidDataFormat('state must be ${DailyReminderStateData.stateDataWhenDisable} or ${DailyReminderStateData.stateDataWhenEnable}. data is $state');
  }

  static int _toState(bool enable) {
    if (enable) {
      return DailyReminderStateData.stateDataWhenEnable;
    } else {
      return DailyReminderStateData.stateDataWhenDisable;
    }
  }

  static DailyRemindType _fromDataRemindType(int remindType) {
    switch (remindType) {
      case DailyReminderStateData.remindTypeDataWhenTheDay:
        return DailyRemindType.theDay;
      case DailyReminderStateData.remindTypeDataWhenBeforeTheDay:
        return DailyRemindType.beforeTheDay;
    }
    throw InvalidDataFormat('remindType must be ${DailyReminderStateData.remindTypeDataWhenTheDay} or ${DailyReminderStateData.remindTypeDataWhenBeforeTheDay}. data is $remindType');
  }

  static int _toRemindType(DailyRemindType remindType) {
    switch (remindType) {
      case DailyRemindType.theDay:
        return DailyReminderStateData.remindTypeDataWhenTheDay;
      case DailyRemindType.beforeTheDay:
        return DailyReminderStateData.remindTypeDataWhenBeforeTheDay;
    }
  }
}

class DailyRemindIdMapper {
  static DailyRemindId fromData(int id) => DailyRemindId(id: id);

  static int toData(DailyRemindId id) => id.value;
}
