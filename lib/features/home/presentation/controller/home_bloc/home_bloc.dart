import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:climatify/core/shared/domain/usecase/get_data_sharedprefs_usecase.dart';
import 'package:climatify/features/home/presentation/controller/home_bloc/home_event.dart';
import 'package:climatify/features/home/presentation/controller/home_bloc/home_state.dart';
import 'package:flutter/foundation.dart';

import '../../../../../core/error/exceptions.dart';
import '../../../../../core/shared/domain/entities/login_entity.dart';
import '../../../../../core/styles/app_string.dart';
import '../../../../../core/usecase/base_usecase.dart';
import '../../../../../core/utils/enums.dart';
import '../../../domain/usecases/get_posts_usecase.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  GetPostsUseCase getPostsUseCase;
  GetDataSharedPrefsUseCase getDataSharedPrefsUseCase;

  HomeBloc(
    this.getPostsUseCase,
    this.getDataSharedPrefsUseCase,
  ) : super(const HomeState()) {
    on<HomeEvent>((event, emit) {});
    on<GetUserDataEvent>(_getUserData);
    on<GetPostsEvent>(_getPosts);
  }

  FutureOr<void> _getUserData(
      GetUserDataEvent event, Emitter<HomeState> emit) async {
    try {
      emit(state.copyWith(
        getUserDataSharedPrefsState: GetUserDataSharedPrefsState.loading,
      ));

      final result = await getDataSharedPrefsUseCase(
          SharedPrefsGetParams(key: AppString.userData));
      result.fold(
          (l) => emit(state.copyWith(
                getUserDataSharedPrefsState: GetUserDataSharedPrefsState.error,
              )), (r) {
        Map<String, dynamic> userDataMap = json.decode(r);

        emit(state.copyWith(
          getUserDataSharedPrefsState: GetUserDataSharedPrefsState.loaded,
          loginUserData: LoginEntity.fromJson(userDataMap),
        ));
      });
    } catch (e) {
      log('UnexpectedException error during getUserData: ${e.toString()}');
    }
  }

  FutureOr<void> _getPosts(GetPostsEvent event, Emitter<HomeState> emit,) async {
    try {
      emit(state.copyWith(
        getPostsRequestState: GetPostsRequestState.loading,
      ));
      final result = await getPostsUseCase(
        GetPostsParams(
          token: state.loginUserData.loginData!.idToken.toString(),
        ),
      );
      result.fold(
        (l) => emit(
          state.copyWith(
            getPostsRequestState: GetPostsRequestState.error,
          ),
        ),
        (r) => emit(
          state.copyWith(
            getPostsRequestState: GetPostsRequestState.loaded,
            postsEntity: r,
          ),
        ),
      );
    } catch (e) {
      if (e is ServerException) {
        emit(state.copyWith(
          getPostsRequestState: GetPostsRequestState.error,
        ));
        final failureMessage = e.errorMessageModel.message;
        if (kDebugMode) {
          log('_getPosts failed with server error: $failureMessage');
        }
        emit(state.copyWith(
          getPostsRequestState: GetPostsRequestState.error,
        ));
      } else if (e is UnexpectedException) {
        emit(state.copyWith(
          getPostsRequestState: GetPostsRequestState.error,
        ));
        if (kDebugMode) {
          log('UnexpectedException error during _getPosts: ${e.message.toString()}');
        }
      } else {
        emit(state.copyWith(
          getPostsRequestState: GetPostsRequestState.error,
        ));
        if (kDebugMode) {
          log('Unexpected error during _getPosts: ${e.toString()}');
        }
      }
    }
  }
}
