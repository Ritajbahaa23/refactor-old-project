import 'package:climatify/core/error/exceptions.dart';
import 'package:climatify/core/network/error_message_model.dart';
import 'package:climatify/features/stories/domain/entities/stories_entity.dart';
import 'package:dio/dio.dart';

import '../../../../core/network/api_constance.dart';

abstract class BaseStoriesRemoteDataSource {
  Future<StoriesEntity> getStories({required String token});
}

class StoriesRemoteDataSource extends BaseStoriesRemoteDataSource {
  @override
  Future<StoriesEntity> getStories({required String token}) async {
    try {
      final response = await Dio().get(
        ApiConstants.getStoriesPath,
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        }),
      );
      if ((response.statusCode == 200) || (response.statusCode == 201)) {
        if (response.data['success'] == true) {
          return StoriesEntity.fromJson(response.data);
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
