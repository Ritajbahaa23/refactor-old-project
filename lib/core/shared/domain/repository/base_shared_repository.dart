import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';

abstract class BaseSharedRepository {

  Future<Either<Failure, dynamic>> getDataFromSharedPreference(
      {required String key});

  Future<Either<Failure, bool>> saveDataSharedPreference(
      {required String key, required dynamic value});

  Future<Either<Failure, bool>> removeData({required String key});

  Future<Either<Failure, void>> clearData();

}
