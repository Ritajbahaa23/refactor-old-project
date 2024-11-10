import 'package:equatable/equatable.dart';

class LoginEntity extends Equatable {
  const LoginEntity({
    required this.success,
    required this.message,
    required this.loginData,
  });

  final bool? success;
  final String? message;
  final LoginData? loginData;

  factory LoginEntity.fromJson(Map<String, dynamic> json) {
    return LoginEntity(
      success: json["success"],
      message: json["message"],
      loginData: json["data"] == null
          ? null
          : LoginData.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": loginData?.toJson(),
  };

  @override
  List<Object?> get props => [
    success,
    message,
    loginData,
  ];
}

class LoginData extends Equatable {
  const LoginData({
    required this.idToken,
    required this.accessToken,
    required this.refreshToken,
  });

  final String? idToken;
  final String? accessToken;
  final String? refreshToken;

  factory LoginData.fromJson(Map<String, dynamic> json) {
    return LoginData(
      idToken: json["idToken"],
      accessToken: json["accessToken"],
      refreshToken: json["refreshToken"],
    );
  }

  Map<String, dynamic> toJson() => {
    "idToken": idToken,
    "accessToken": accessToken,
    "refreshToken": refreshToken,
  };

  @override
  List<Object?> get props => [
    idToken,
    accessToken,
    refreshToken,
  ];
}
