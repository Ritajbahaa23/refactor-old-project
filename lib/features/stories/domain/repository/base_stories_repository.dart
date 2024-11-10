import 'package:climatify/core/error/failure.dart';
import 'package:climatify/features/stories/domain/entities/stories_entity.dart';
import 'package:dartz/dartz.dart';

abstract class BaseStoriesRepository {
  Future<Either<Failure, StoriesEntity>> getStories({
    required String token,
  });
}
