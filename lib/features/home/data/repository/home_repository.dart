import 'package:climatify/core/error/failure.dart';

import 'package:climatify/features/home/domain/entities/posts_entity.dart';

import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../domain/repository/base_home_repository.dart';
import '../datasource/home_local_datasource.dart';
import '../datasource/home_remote_data_source.dart';

class HomeRepository extends BaseHomeRepository {
  final BaseHomeLocalDataSource baseHomeLocalDataSource;
  final BaseHomeRemoteDataSource baseHomeRemoteDataSource;

  HomeRepository(this.baseHomeLocalDataSource, this.baseHomeRemoteDataSource);

  @override
  Future<Either<Failure, PostsEntity>> getPosts({required String token}) async {
    final result = await baseHomeRemoteDataSource.getPosts(token: token);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(
          failure.errorMessageModel.message.toString(),
        ),
      );
    }
  }
}
