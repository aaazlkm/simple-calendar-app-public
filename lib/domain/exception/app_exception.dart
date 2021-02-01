class AppException implements Exception {
  AppException(this.message);

  final String message;

  @override
  String toString() => message;
}

class InvalidDataFormat extends AppException {
  InvalidDataFormat(String message) : super('invalid data format: $message');
}
