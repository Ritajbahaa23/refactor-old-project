import 'package:equatable/equatable.dart';

class BasicEntity extends Equatable {
  const BasicEntity({
    required this.status,
    required this.message,
    required this.errorNum,
  });

  final int? status;
  final String? message;
  final String? errorNum;

  factory BasicEntity.fromJson(Map<String, dynamic> json) {
    return BasicEntity(
      status: json["status"],
      message: json["message"],
      errorNum: json["errorNum"],
    );
  }

  @override
  List<Object?> get props => [
        status,
        message,
        errorNum,
      ];
}
