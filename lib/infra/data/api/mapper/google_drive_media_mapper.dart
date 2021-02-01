import 'package:googleapis/drive/v3.dart' as drive;
import 'package:simple_calendar_app/domain/sync/model/backup_media.dart';

class GoogleDriveMediaMapper {
  static BackupMedia fromData(drive.Media media) => BackupMedia(
        stream: media.stream,
        contentType: media.contentType,
        length: media.length,
      );
}
