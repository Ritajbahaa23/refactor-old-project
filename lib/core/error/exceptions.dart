import 'package:climatify/core/network/error_model.dart';

import '../network/error_message_model.dart';

class ServerException implements Exception {
  final ErrorMessageModel errorMessageModel;

  const ServerException({
    required this.errorMessageModel,
  });
}

class ValidationException implements Exception {
  final ErrorModel errorModel;

  const ValidationException({
    required this.errorModel,
  });
}

class LocalDatabaseException implements Exception {
  final String message;

  const LocalDatabaseException({
    required this.message,
  });
}

class UnexpectedException implements Exception {
  final String message;

  const UnexpectedException({required this.message});
}
