import 'package:dartz/dartz.dart';
import '../../../error/exceptions.dart';
import '../../../error/failure.dart';
import '../../domain/repository/base_shared_repository.dart';
import '../datasource/shared_local_datasource.dart';

class SharedRepository extends BaseSharedRepository {
  final BaseSharedLocalDataSource baseAuthenticationLocalDataSource;

  SharedRepository(
    this.baseAuthenticationLocalDataSource,
  );

  @override
  Future<Either<Failure, bool>> clearData() async {
    final result = await baseAuthenticationLocalDataSource.clearData();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
          SharedPrefFailure(failure.errorMessageModel.message.toString()));
    }
  }

  @override
  Future<Either<Failure, dynamic>> getDataFromSharedPreference(
      {required String key}) async {
    final result = await baseAuthenticationLocalDataSource
        .getDataFromSharedPreference(key: key);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
          SharedPrefFailure(failure.errorMessageModel.message.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> removeData({required String key}) async {
    final result = await baseAuthenticationLocalDataSource.removeData(key: key);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
          SharedPrefFailure(failure.errorMessageModel.message.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> saveDataSharedPreference(
      {required String key, required value}) async {
    final result = await baseAuthenticationLocalDataSource
        .saveDataSharedPreference(key: key, value: value);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
          SharedPrefFailure(failure.errorMessageModel.message.toString()));
    }
  }

}
