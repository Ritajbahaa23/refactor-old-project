import 'package:climatify/core/shared/domain/entities/login_entity.dart';
import 'package:climatify/core/utils/enums.dart';
import 'package:climatify/features/stories/domain/entities/stories_entity.dart';
import 'package:equatable/equatable.dart';

class StoriesState extends Equatable {
  final StoriesEntity stories;
  final RequestState requestState;
  final LoginEntity loginUserData;

  const StoriesState({
    this.loginUserData = const LoginEntity(
      success: false,
      message: '',
      loginData: LoginData(
        idToken: '',
        accessToken: '',
        refreshToken: '',
      ),
    ),
    this.requestState = RequestState.initial,
    this.stories = const StoriesEntity(
      success: false,
      message: '',
      data: [],
    ),
  });

  StoriesState copyWith({
    StoriesEntity? stories,
    RequestState? requestState,
    LoginEntity? loginUserData,
  }) {
    return StoriesState(
      loginUserData: loginUserData ?? this.loginUserData,
      stories: stories ?? this.stories,
      requestState: requestState ?? this.requestState,
    );
  }

  @override
  List<Object> get props => [stories, requestState, loginUserData];
}

// If you have a separate state for creating stories, it's better to define it separately.
class CreateStoryState extends StoriesState {}
