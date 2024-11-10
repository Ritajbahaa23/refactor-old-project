import 'package:climatify/features/home/domain/entities/posts_entity.dart';
import 'package:climatify/features/home/domain/repository/base_home_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:climatify/core/error/failure.dart';
import 'package:climatify/core/usecase/base_usecase.dart';

class GetPostsUseCase extends BaseUseCase<PostsEntity, GetPostsParams> {
  final BaseHomeRepository baseHomeRepository;

  GetPostsUseCase(this.baseHomeRepository);

  @override
  Future<Either<Failure, PostsEntity>> call(GetPostsParams parameters) async {
    return await baseHomeRepository.getPosts(
      token: parameters.token,
    );
  }
}
