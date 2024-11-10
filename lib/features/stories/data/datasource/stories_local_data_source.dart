import 'package:climatify/core/error/exceptions.dart';
import 'package:climatify/core/network/error_message_model.dart';
import 'package:climatify/features/stories/domain/entities/stories_entity.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/network/api_constance.dart';

abstract class BaseStoriesLocalDataSource {
}

class StoriesLocalDataSource
    implements BaseStoriesLocalDataSource {
  final SharedPreferences sharedPreferences;

  StoriesLocalDataSource(this.sharedPreferences);

}