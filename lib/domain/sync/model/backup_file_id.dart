import 'package:freezed_annotation/freezed_annotation.dart';

part 'backup_file_id.freezed.dart';

// デフォルト引数を持ったコンストラクタを生成したいため
// ignore_for_file: prefer_constructors_over_static_methods

@freezed
class BackupFileId with _$BackupFileId {
  const factory BackupFileId({
    required final String value,
  }) = _BackupFileId;

  const BackupFileId._();
}
