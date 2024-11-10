import 'package:climatify/core/shared/domain/entities/login_entity.dart';
import 'package:climatify/features/home/domain/entities/posts_entity.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/utils/enums.dart';

class HomeState extends Equatable {
  final int screenIndex;
  final LoginEntity loginUserData;
  final GetUserDataSharedPrefsState getUserDataSharedPrefsState;

  final PostsEntity postsEntity;
  final GetPostsRequestState getPostsRequestState;

  const HomeState({
    this.screenIndex = 0,
    this.loginUserData = const LoginEntity(
      success: false,
      message: '',
      loginData: LoginData(
        idToken: '',
        accessToken: '',
        refreshToken: '',
      ),
    ),
    this.getUserDataSharedPrefsState = GetUserDataSharedPrefsState.initial,
    this.postsEntity = const PostsEntity(
      success: false,
      message: '',
      data: [],
    ),
    this.getPostsRequestState = GetPostsRequestState.initial,
  });

  HomeState copyWith({
    int? screenIndex,
    LoginEntity? loginUserData,
    GetUserDataSharedPrefsState? getUserDataSharedPrefsState,
    PostsEntity? postsEntity,
    GetPostsRequestState? getPostsRequestState,
  }) {
    return HomeState(
      screenIndex: screenIndex ?? this.screenIndex,
      loginUserData: loginUserData ?? this.loginUserData,
      getUserDataSharedPrefsState:
          getUserDataSharedPrefsState ?? this.getUserDataSharedPrefsState,
      postsEntity: postsEntity ?? this.postsEntity,
      getPostsRequestState: getPostsRequestState ?? this.getPostsRequestState,
    );
  }

  @override
  List<Object> get props => [
        screenIndex,
        loginUserData,
        getUserDataSharedPrefsState,
        postsEntity,
        getPostsRequestState,
      ];
}
