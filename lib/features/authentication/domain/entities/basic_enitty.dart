import 'package:equatable/equatable.dart';

class BasicEntity extends Equatable {
  const BasicEntity({
    required this.success,
    required this.message,
  });

  final bool? success;
  final String? message;

  factory BasicEntity.fromJson(Map<String, dynamic> json) {
    return BasicEntity(
      success: json["success"],
      message: json["message"],
    );
  }

  @override
  List<Object?> get props => [
        success,
        message,
      ];
}
