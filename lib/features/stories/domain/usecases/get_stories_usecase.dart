import 'package:climatify/core/error/failure.dart';
import 'package:climatify/core/usecase/base_usecase.dart';

import 'package:climatify/features/stories/domain/entities/stories_entity.dart';
import 'package:climatify/features/stories/domain/repository/base_stories_repository.dart';
import 'package:dartz/dartz.dart';

class GetStoriesUsecase extends BaseUseCase<StoriesEntity, GetStoriesParams> {
  final BaseStoriesRepository baseStoriesRepository;

  GetStoriesUsecase(this.baseStoriesRepository);

  @override
  Future<Either<Failure, StoriesEntity>> call(
      GetStoriesParams parameters) async {
    return await baseStoriesRepository.getStories(
      token: parameters.token,
    );
  }
}


