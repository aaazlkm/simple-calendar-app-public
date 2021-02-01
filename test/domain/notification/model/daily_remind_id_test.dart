import 'package:flutter_test/flutter_test.dart';
import 'package:simple_calendar_app/domain/notification/model/daily_remind_id.dart';
import 'package:timezone/timezone.dart';

void main() {
  test('id test', () {
    final id1 = DailyRemindId.from(TZDateTime(UTC, 2021, 2, 3));
    final id2 = DailyRemindId.from(TZDateTime(UTC, 2021, 8, 22));
    final id3 = DailyRemindId.from(TZDateTime(UTC, 2021, 11, 12));
    expect(id1.value, 202123);
    expect(id2.value, 2021822);
    expect(id3.value, 20211112);
  });
}
