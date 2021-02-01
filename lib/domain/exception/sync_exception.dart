class SyncException implements Exception {
  SyncException(this.message);

  final String message;

  @override
  String toString() => message;
}

class InvalidBackupFileExtensionException extends SyncException {
  InvalidBackupFileExtensionException({required String correctExtension}) : super('invalid backup file extension exception. Need $correctExtension file.');
}

class NotExistsDatabaseFileException extends SyncException {
  NotExistsDatabaseFileException() : super('there is no database file in backup file.');
}
