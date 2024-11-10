import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'dart:developer' as developer;
import 'package:flutter/material.dart';

import 'package:bloc/bloc.dart';
import 'package:climatify/core/error/exceptions.dart';
import 'package:climatify/core/usecase/base_usecase.dart';
import 'package:climatify/core/utils/enums.dart';
import 'package:climatify/features/stories/domain/usecases/get_stories_usecase.dart';
import 'package:climatify/features/stories/presentation/controller/stories_event.dart';
import 'package:climatify/features/stories/presentation/controller/stories_state.dart';
import 'package:flutter/foundation.dart';
import 'package:story_view/story_view.dart';

class StoriesBloc extends Bloc<StoriesEvent, StoriesState> {
  StoryController storyController = StoryController();
  GetStoriesUsecase getStoriesUsecase;

  StoriesBloc(this.getStoriesUsecase) : super(const StoriesState()) {
    on<StoriesEvent>((event, emit) {});
    on<GetStoriesEvent>(_getStories);
  }

  FutureOr<void> _getStories(
      GetStoriesEvent event, Emitter<StoriesState> emit) async {
    try {
      emit(state.copyWith(requestState: RequestState.loading));
      final result = await getStoriesUsecase(GetStoriesParams(
        token: state.loginUserData.loginData!.idToken.toString(),
      ));
      result.fold(
        (l) => emit(state.copyWith(requestState: RequestState.error)),
        (r) =>
            emit(state.copyWith(stories: r, requestState: RequestState.loaded)),
      );
    } catch (e) {
      emit(state.copyWith(requestState: RequestState.error));
      final failureMessage = e is ServerException
          ? e.errorMessageModel.message
          : e is UnexpectedException
              ? e.message
              : e.toString();
      if (kDebugMode) {
        developer.log('_getStories failed with error: $failureMessage');
      }
    }
  }

  final GlobalKey _globalKey = GlobalKey();
  String path = '';

}
