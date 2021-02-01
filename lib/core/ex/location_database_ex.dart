import 'package:timezone/timezone.dart';

extension LocationDatabaseEx on LocationDatabase {
  /// timezoneパッケージでgetLocationが定義されているが、この関数はlocationNameが存在しない場合エラーになる
  /// 操作しづらいため、存在しない時はnullを返す拡張関数を定義する
  /// databaseに登録されていないケース: GMT
  Location? getLocationOrNull(String locationName) => locations[locationName];
}
