import 'package:googleapis/drive/v3.dart' as drive;
import 'package:simple_calendar_app/domain/sync/model/backup_file_id.dart';
import 'package:simple_calendar_app/domain/sync/model/backup_file.dart';

class GoogleDriveFileMapper {
  /// id
  static BackupFile? fromDataOrNull(drive.File file) {
    final id = file.id;
    final name = file.name;
    final modifiedTime = file.modifiedTime;

    if (id == null) {
      return null;
    }

    if (name == null) {
      return null;
    }

    if (modifiedTime == null) {
      return null;
    }

    return BackupFile(
      id: BackupFileId(value: id),
      name: name,
      modifiedTime: modifiedTime.toLocal(),
    );
  }
}
