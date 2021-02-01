import 'dart:io';

import 'package:archive/archive_io.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:simple_calendar_app/core/logger.dart';
import 'package:simple_calendar_app/domain/exception/sync_exception.dart';

Future<File> zipDirectory(Directory directory, {required String toFilePath}) async {
  final zipFile = File(toFilePath);
  await _zipDirectoryInBackground(directory, toFilePath: toFilePath);
  return zipFile;
}

/// zip 処理をする際そのまま実行すると同期的に処理されるため画面がカクツク
/// そのため別のIsolateで実行する
Future<void> _zipDirectoryInBackground(Directory directory, {required String toFilePath}) => compute(_zipDirectory, _ZipArgument(directory, toFilePath));

Future<void> _zipDirectory(_ZipArgument argument) async => ZipFileEncoder().zipDirectory(argument.directory, filename: argument.fileName);

class _ZipArgument {
  _ZipArgument(this.directory, this.fileName);

  final Directory directory;
  final String fileName;
}

Future<Directory> unzipFile(File zipFile) async {
  if (extension(zipFile.path) != '.zip') {
    throw InvalidBackupFileExtensionException(correctExtension: '.zip');
  }
  final destinationDir = Directory(join(dirname(zipFile.path), basenameWithoutExtension(zipFile.path)));
  final stopwatch = Stopwatch()..start();
  final archive = ZipDecoder().decodeBytes(zipFile.readAsBytesSync());
  for (final archiveFile in archive) {
    if (archiveFile.isFile) {
      final file = File(join(destinationDir.path, archiveFile.name));
      await file.create(recursive: true);
      file.writeAsBytesSync(archiveFile.content as List<int>);
    } else {
      final directory = Directory(join(destinationDir.path, archiveFile.name));
      await directory.create(recursive: true);
    }
  }
  logger.info('unzip executed in ${stopwatch.elapsed}');
  return destinationDir;
}
