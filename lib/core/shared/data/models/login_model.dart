import '../../domain/entities/login_entity.dart';

class LoginModel extends LoginEntity {
  const LoginModel({
    required super.message,
    required super.success,
    required super.loginData,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      success: json['success'],
      message: json['message'],
      loginData: json['data'] == null ? null : LoginData.fromJson(json['data']),
    );
  }
}
