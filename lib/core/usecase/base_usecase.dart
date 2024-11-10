import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../error/failure.dart';

abstract class BaseUseCase<T, Parameters> {
  Future<Either<Failure, T>> call(Parameters parameters);
}

class NoParameters extends Equatable {
  const NoParameters();

  @override
  List<Object> get props => [];
}

class LoginParams {
  final String username;
  final String password;

  LoginParams({
    required this.username,
    required this.password,
  });
}

class SharedPrefsGetParams {
  final String key;

  SharedPrefsGetParams({
    required this.key,
  });
}

class SharedPrefsRemoveParams {
  final String key;

  SharedPrefsRemoveParams({
    required this.key,
  });
}

class LogoutParams {
  final String token;

  LogoutParams({
    required this.token,
  });
}

class SharedPrefsSetParams {
  final String key;
  final String value;

  SharedPrefsSetParams({
    required this.key,
    required this.value,
  });
}

class RegisterParams {
  final String email;
  final String password;
  final String username;
  final String firstName;
  final String lastName;
  final String affiliation;
  final String nationality;
  final String country;
  final String city;
  final String dateOfBirth;
  final String phone;

  RegisterParams({
    required this.email,
    required this.password,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.affiliation,
    required this.nationality,
    required this.country,
    required this.city,
    required this.dateOfBirth,
    required this.phone,
  });
}

class VerifyCodeParams {
  final String code;
  final String username;

  VerifyCodeParams({
    required this.code,
    required this.username,
  });
}

class ResendVerifyCodeParams {
  final String username;

  ResendVerifyCodeParams({
    required this.username,
  });
}

class ForgetPasswordParams {
  final String email;

  ForgetPasswordParams({
    required this.email,
  });
}

class ConfirmForgetPasswordParams {
  final String code;
  final String email;
  final String password;

  ConfirmForgetPasswordParams({
    required this.code,
    required this.email,
    required this.password,
  });
}

class GetPostsParams {
  final String token;

  GetPostsParams({
    required this.token,
  });
}

class GetStoriesParams {
  final String token;

  GetStoriesParams({
    required this.token,
  });
}
class GoogleAuthParams {}