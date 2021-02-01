import 'package:json_annotation/json_annotation.dart';

part 'daily_reminder_state_data.g.dart';

@JsonSerializable(explicitToJson: true)
class DailyReminderStateData {
  DailyReminderStateData({
    required this.state,
    required this.remindType,
    required this.hour,
    required this.minute,
  });

  factory DailyReminderStateData.fromJson(Map<String, dynamic> json) => _$DailyReminderStateDataFromJson(json);

  static const int stateDataWhenEnable = 1;
  static const int stateDataWhenDisable = 0;

  static const int remindTypeDataWhenTheDay = 1;
  static const int remindTypeDataWhenBeforeTheDay = 0;

  final int state;
  final int remindType;
  final int hour;
  final int minute;

  Map<String, dynamic> toJson() => _$DailyReminderStateDataToJson(this);
}
