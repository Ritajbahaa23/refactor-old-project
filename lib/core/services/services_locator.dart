import 'package:climatify/core/shared/data/datasource/shared_local_datasource.dart';
import 'package:climatify/core/shared/data/repository/shared_repository.dart';
import 'package:climatify/features/authentication/data/datasource/authentication_local_datasource.dart';
import 'package:climatify/features/authentication/data/datasource/authentication_remote_data_source.dart';
import 'package:climatify/features/authentication/domain/usecases/google_auth.dart';
import 'package:climatify/features/authentication/domain/usecases/login_usecase.dart';
import 'package:climatify/features/authentication/domain/usecases/register_usecase.dart';
import 'package:climatify/features/authentication/domain/usecases/verify_code_usecase.dart';
import 'package:climatify/features/authentication/presentation/controller/authentication/authentication_bloc.dart';
import 'package:climatify/features/boarding/data/datasource/boarding_local_datasource.dart';
import 'package:climatify/features/boarding/data/datasource/boarding_remote_data_source.dart';
import 'package:climatify/features/boarding/presentation/controller/base_bloc/base_bloc.dart';
import 'package:climatify/features/home/data/datasource/home_local_datasource.dart';
import 'package:climatify/features/home/data/datasource/home_remote_data_source.dart';
import 'package:climatify/features/home/data/repository/home_repository.dart';
import 'package:climatify/features/home/domain/repository/base_home_repository.dart';
import 'package:climatify/features/home/domain/usecases/get_posts_usecase.dart';
import 'package:climatify/features/home/presentation/controller/home_bloc/home_bloc.dart';
import 'package:climatify/features/notifications/presentation/controller/notifications_bloc/notifications_bloc.dart';
import 'package:climatify/features/profile/presentation/controller/profile_bloc/profile_bloc.dart';
import 'package:climatify/features/search/presentation/controller/search_bloc/search_bloc.dart';
import 'package:climatify/features/settings/presentation/controller/settings_bloc/settings_bloc.dart';
import 'package:climatify/features/stories/data/datasource/stories_local_data_source.dart';
import 'package:climatify/features/stories/data/datasource/stories_remote_data_source.dart';
import 'package:climatify/features/stories/data/repository/stories_repository.dart';
import 'package:climatify/features/stories/domain/repository/base_stories_repository.dart';
import 'package:climatify/features/stories/domain/usecases/get_stories_usecase.dart';
import 'package:climatify/features/stories/presentation/controller/stories_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/authentication/data/repository/authentication_repository.dart';
import '../../features/authentication/domain/repository/base_authentication_repository.dart';
import '../../features/authentication/domain/usecases/confirm_forget_password_usecase.dart';
import '../../features/authentication/domain/usecases/forget_password_usecase.dart';
import '../../features/authentication/domain/usecases/resend_verify_code_usecase.dart';
import '../../features/boarding/data/repository/boarding_repository.dart';
import '../../features/boarding/domain/repository/base_boarding_repository.dart';
import '../../features/chat/presentation/components/controller/chat_bloc/chat_bloc.dart';
import '../../features/layout/presentation/controller/layout_bloc/layout_bloc.dart';
import '../localization/app_localization.dart';
import '../shared/domain/repository/base_shared_repository.dart';
import '../shared/domain/usecase/clear_data_sharedprefs_usecase.dart';
import '../shared/domain/usecase/get_data_sharedprefs_usecase.dart';
import '../shared/domain/usecase/save_data_sharedprefs_usecase.dart';

final sl = GetIt.instance;

class ServicesLocator {
  Future<void> init() async {
    ////////////////////////////////////////////////////////////////////////////
    /// Bloc
    /// Authentication
    sl.registerFactory(() => AuthenticationBloc(
          sl(),
          sl(),
          sl(),
          sl(),
          sl(),
          sl(),
          sl(),
          sl(),
          sl(),
        ));

    /// Boarding(Base)
    sl.registerFactory(() => BaseBloc(
          sl(),
          sl(),
        ));

    /// Layout
    sl.registerFactory(() => LayoutBloc());

    /// Home

  
    sl.registerFactory(() => StoriesBloc());

    sl.registerFactory(() => HomeBloc(
          sl(),
          sl(),
        ));

    /// Chat
    sl.registerFactory(() => ChatBloc());

    /// Notifications
    sl.registerFactory(() => NotificationsBloc());

    /// Profile
    sl.registerFactory(() => ProfileBloc());

    /// Search
    sl.registerFactory(() => SearchBloc());

    /// Settings
    sl.registerFactory(() => SettingsBloc());

    /// Stories
    sl.registerFactory(() => StoriesBloc(sl()));

    ////////////////////////////////////////////////////////////////////////////


    /// Use Cases
    /// GLOBAL

    sl.registerLazySingleton(() => GetDataSharedPrefsUseCase(sl()));
    sl.registerLazySingleton(() => SetDataSharedPrefsUseCase(sl()));
    sl.registerLazySingleton(() => ClearDataSharedPrefsUseCase(sl()));

    /// Authentication
    sl.registerLazySingleton(() => LoginUseCase(sl()));
    sl.registerLazySingleton(() => RegisterUseCase(sl()));
    sl.registerLazySingleton(() => VerifyCodeUseCase(sl()));
    sl.registerLazySingleton(() => ResendVerifyCodeUseCase(sl()));
    sl.registerLazySingleton(() => ForgetPasswordUseCase(sl()));
    sl.registerLazySingleton(() => ConfirmForgetPasswordUseCase(sl()));
    sl.registerLazySingleton(() => GoogleAuthUseCase(sl()));

    /// Boarding

    /// HOME
    sl.registerLazySingleton(() => GetPostsUseCase(sl()));

    /// Stories
    sl.registerLazySingleton(() => GetStoriesUsecase(sl()));

    ////////////////////////////////////////////////////////////////////////////

    /// Repository
    /// Shared
    sl.registerLazySingleton<BaseSharedRepository>(
        () => SharedRepository(sl()));

    /// Authentication
    sl.registerLazySingleton<BaseAuthenticationRepository>(
        () => AuthenticationRepository(sl(), sl()));

    /// Boarding
    sl.registerLazySingleton<BaseBoardingRepository>(
        () => BoardingRepository(sl(), sl()));

    /// Home
    sl.registerLazySingleton<BaseHomeRepository>(
        () => HomeRepository(sl(), sl()));

    /// Stories
    sl.registerLazySingleton<BaseStoriesRepository>(
        () => StoriesRepository(sl(),sl()));

    ////////////////////////////////////////////////////////////////////////////

    /// DATA SOURCE
    /// Shared
    sl.registerLazySingleton<BaseSharedLocalDataSource>(
        () => SharedLocalDataSource(sl()));

    /// Authentication
    sl.registerLazySingleton<BaseAuthenticationLocalDataSource>(
        () => AuthenticationLocalDataSource(sl()));
    sl.registerLazySingleton<BaseAuthenticationRemoteDataSource>(
        () => AuthenticationRemoteDataSource());

    /// Boarding
    sl.registerLazySingleton<BaseBoardingRemoteDataSource>(
        () => BoardingRemoteDataSource());
    sl.registerLazySingleton<BaseBoardingLocalDataSource>(
        () => BoardingLocalDataSource(sl()));

    /// Home
    sl.registerLazySingleton<BaseHomeRemoteDataSource>(
        () => HomeRemoteDataSource());
    sl.registerLazySingleton<BaseHomeLocalDataSource>(
        () => HomeLocalDataSource(sl()));

    /// Stories
    sl.registerLazySingleton<StoriesRemoteDataSource>(
        () => StoriesRemoteDataSource());
    sl.registerLazySingleton<StoriesLocalDataSource>(
            () => StoriesLocalDataSource(sl()));

    ////////////////////////////////////////////////////////////////////////////
    ///Shared Prefs
    final sharedPreferences = await SharedPreferences.getInstance();
    sl.registerLazySingleton(() => sharedPreferences);

    ////////////////////////////////////////////////////////////////////////////
    /// APP LOCALIZATION
    sl.registerLazySingleton<AppLocalizations>(
      () => AppLocalizations(sl()),
    );

    ////////////////////////////////////////////////////////////////////////////
  }
}
