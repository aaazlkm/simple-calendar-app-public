import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:timezone/timezone.dart';

part 'daily_remind_id.freezed.dart';

// デフォルト引数を持ったコンストラクタを生成したいため
// ignore_for_file: prefer_constructors_over_static_methods

@freezed
class DailyRemindId with _$DailyRemindId {
  const factory DailyRemindId({required final int id}) = _DailyRemindId;

  const factory DailyRemindId.from(TZDateTime dateTime) = _DailyRemindIdFrom;

  const DailyRemindId._();

  /// idを生成する
  int get value => map(
        (value) => value.id,
        from: (from) => int.parse('${from.dateTime.year}${from.dateTime.month}${from.dateTime.day}'),
      );
}
