import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
  const ErrorMessageModel({
    required this.success,
    required this.message,
    required this.error,
  });

  final bool? success;
  final String? message;
  final dynamic error;

  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) {
    return ErrorMessageModel(
      success: json["success"],
      message: json["message"],
      error: json["error"],
    );
  }

  @override
  List<Object?> get props => [
        success,
        message,
        error,
      ];
}
