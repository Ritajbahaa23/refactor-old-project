import 'package:climatify/core/error/failure.dart';
import 'package:climatify/features/authentication/domain/entities/basic_enitty.dart';
import 'package:climatify/features/authentication/domain/entities/google_auth_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/shared/domain/entities/login_entity.dart';

abstract class BaseAuthenticationRepository {
  Future<Either<Failure, LoginEntity>> login({
    required String username,
    required String password,
  });

  Future<Either<Failure, BasicEntity>> register({
    required String email,
    required String password,
    required String username,
    required String firstName,
    required String lastName,
    required String affiliation,
    required String nationality,
    required String country,
    required String city,
    required String dateOfBirth,
    required String phone,
  });

  Future<Either<Failure, BasicEntity>> verifyCode({
    required String code,
    required String username,
  });

  Future<Either<Failure, BasicEntity>> resendVerifyCode({
    required String username,
  });

  Future<Either<Failure, BasicEntity>> forgetPassword({required String email});

  Future<Either<Failure, BasicEntity>> confirmForgetPassword({
    required String code,
    required String email,
    required String password,
  });
  Future<Either<Failure, GoogleAuthEntity>> googleAuth();
}
