import 'package:climatify/core/error/exceptions.dart';
import 'package:climatify/core/error/failure.dart';
import 'package:climatify/features/stories/data/datasource/stories_local_data_source.dart';
import 'package:climatify/features/stories/data/datasource/stories_remote_data_source.dart';
import 'package:climatify/features/stories/domain/entities/stories_entity.dart';
import 'package:climatify/features/stories/domain/repository/base_stories_repository.dart';
import 'package:dartz/dartz.dart';

//
class StoriesRepository extends BaseStoriesRepository {
  final StoriesRemoteDataSource storiesRemoteDataSource;
  final StoriesLocalDataSource storiesLocalDataSource;

  StoriesRepository(this.storiesRemoteDataSource,this.storiesLocalDataSource);

  @override
  Future<Either<Failure, StoriesEntity>> getStories(
      {required String token}) async {
    final result = await storiesRemoteDataSource.getStories(token: token);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.message.toString()));
    }
  }
}
