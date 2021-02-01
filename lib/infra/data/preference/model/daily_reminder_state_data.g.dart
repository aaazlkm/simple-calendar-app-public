// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_reminder_state_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DailyReminderStateData _$DailyReminderStateDataFromJson(
    Map<String, dynamic> json) {
  return DailyReminderStateData(
    state: json['state'] as int,
    remindType: json['remindType'] as int,
    hour: json['hour'] as int,
    minute: json['minute'] as int,
  );
}

Map<String, dynamic> _$DailyReminderStateDataToJson(
        DailyReminderStateData instance) =>
    <String, dynamic>{
      'state': instance.state,
      'remindType': instance.remindType,
      'hour': instance.hour,
      'minute': instance.minute,
    };
