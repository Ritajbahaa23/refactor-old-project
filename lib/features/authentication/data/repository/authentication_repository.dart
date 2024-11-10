import 'package:climatify/core/error/exceptions.dart';
import 'package:climatify/core/error/failure.dart';
import 'package:climatify/features/authentication/data/datasource/authentication_local_datasource.dart';
import 'package:climatify/features/authentication/data/datasource/authentication_remote_data_source.dart';
import 'package:climatify/features/authentication/domain/entities/basic_enitty.dart';
import 'package:climatify/features/authentication/domain/entities/google_auth_entity.dart';
import 'package:climatify/features/authentication/domain/repository/base_authentication_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/shared/domain/entities/login_entity.dart';

class AuthenticationRepository extends BaseAuthenticationRepository {
  final BaseAuthenticationRemoteDataSource baseAuthenticationRemoteDataSource;
  final BaseAuthenticationLocalDataSource baseAuthenticationLocalDataSource;

  AuthenticationRepository(
    this.baseAuthenticationRemoteDataSource,
    this.baseAuthenticationLocalDataSource,
  );

  @override
  Future<Either<Failure, LoginEntity>> login({
    required String username,
    required String password,
  }) async {
    final result = await baseAuthenticationRemoteDataSource.login(
      username: username,
      password: password,
    );
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.message.toString()));
    }
  }

  @override
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
  }) async {
    final result = await baseAuthenticationRemoteDataSource.register(
      email: email,
      password: password,
      username: username,
      firstName: firstName,
      lastName: lastName,
      affiliation: affiliation,
      nationality: nationality,
      country: country,
      city: city,
      dateOfBirth: dateOfBirth,
      phone: phone,
    );
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.message.toString()));
    }
  }

  @override
  Future<Either<Failure, BasicEntity>> verifyCode({
    required String code,
    required String username,
  }) async {
    final result = await baseAuthenticationRemoteDataSource.verifyCode(
      code: code,
      username: username,
    );
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.message.toString()));
    }
  }

  @override
  Future<Either<Failure, BasicEntity>> forgetPassword({
    required String email,
  }) async {
    final result = await baseAuthenticationRemoteDataSource.forgetPassword(
      email: email,
    );
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.message.toString()));
    }
  }

  @override
  Future<Either<Failure, BasicEntity>> confirmForgetPassword({
    required String code,
    required String email,
    required String password,
  }) async {
    final result =
        await baseAuthenticationRemoteDataSource.confirmForgetPassword(
      code: code,
      email: email,
      password: password,
    );
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.message.toString()));
    }
  }

  @override
  Future<Either<Failure, BasicEntity>> resendVerifyCode(
      {required String username}) async {
    final result = await baseAuthenticationRemoteDataSource.resendVerification(
      username: username,
    );
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.message.toString()));
    }
  }

  @override
  Future<Either<Failure, GoogleAuthEntity>> googleAuth() async {
    final result = await baseAuthenticationRemoteDataSource.googleAuth();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.message.toString()));
    }
  }
}
