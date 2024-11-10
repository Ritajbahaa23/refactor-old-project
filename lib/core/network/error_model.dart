import 'package:equatable/equatable.dart';

class ErrorModel extends Equatable {
  const ErrorModel({
    required this.status,
    required this.message,
    required this.error,
  });

  final String? status;
  final String? message;
  final dynamic error;

  factory ErrorModel.fromJson(Map<String, dynamic> json) {
    return ErrorModel(
      status: json["status"].toString(),
      message: json["message"],
      error: json["error"],
    );
  }

  @override
  List<Object?> get props => [
        status,
        message,
        error,
      ];
}

