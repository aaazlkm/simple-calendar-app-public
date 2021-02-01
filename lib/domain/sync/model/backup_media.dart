import 'package:freezed_annotation/freezed_annotation.dart';

part 'backup_media.freezed.dart';

// デフォルト引数を持ったコンストラクタを生成したいため
// ignore_for_file: prefer_constructors_over_static_methods

@freezed
class BackupMedia with _$BackupMedia {
  const factory BackupMedia({
    required final Stream<List<int>> stream,
    required final String contentType,
    final int? length,
  }) = _BackupMedia;

  const BackupMedia._();
}
