import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:simple_calendar_app/domain/sync/model/backup_file_id.dart';

part 'backup_file.freezed.dart';

// デフォルト引数を持ったコンストラクタを生成したいため
// ignore_for_file: prefer_constructors_over_static_methods

@freezed
class BackupFile with _$BackupFile {
  const factory BackupFile({
    required final BackupFileId id,
    required final String name,
    required final DateTime modifiedTime,
  }) = _BackupFile;

  const BackupFile._();
}
