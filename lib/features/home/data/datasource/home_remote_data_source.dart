import 'package:climatify/features/home/domain/entities/posts_entity.dart';
import 'package:dio/dio.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/network/api_constance.dart';
import '../../../../core/network/error_message_model.dart';

abstract class BaseHomeRemoteDataSource {
  Future<PostsEntity> getPosts({
    required String token,
  });
}

class HomeRemoteDataSource implements BaseHomeRemoteDataSource {
  @override
  Future<PostsEntity> getPosts({
    required String token,
  }) async {
    try {
      final response = await Dio().get(
        ApiConstants.getPostsPath,
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        }),
      );
      if ((response.statusCode == 200) || (response.statusCode == 201)) {
        if (response.data['success'] == true) {
          return PostsEntity.fromJson(response.data);
        } else {
          throw ServerException(
            errorMessageModel: ErrorMessageModel.fromJson(response.data),
          );
        }
      } else {
        throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data),
        );
      }
    } catch (error) {
      if (error is DioError) {
        throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(error.response!.data),
        );
      } else if (error is ServerException) {
        rethrow;
      } else {
        throw UnexpectedException(
          message: error.toString(),
        );
      }
    }
  }
}
