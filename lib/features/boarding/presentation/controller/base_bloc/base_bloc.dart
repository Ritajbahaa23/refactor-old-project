import 'dart:convert';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:climatify/core/shared/domain/entities/login_entity.dart';
import 'package:climatify/core/shared/domain/usecase/get_data_sharedprefs_usecase.dart';
import 'package:climatify/core/shared/domain/usecase/save_data_sharedprefs_usecase.dart';
import 'package:climatify/core/styles/app_string.dart';
import 'package:climatify/core/usecase/base_usecase.dart';
import 'package:climatify/core/utils/enums.dart';
import 'package:flutter/material.dart';
import 'base_event.dart';
import 'base_state.dart';

class BaseBloc extends Bloc<BaseEvent, BaseState> {
  GetDataSharedPrefsUseCase getDataSharedPrefsUseCase;
  SetDataSharedPrefsUseCase setDataSharedPrefsUseCase;

  /// VARS
  ///
  List<String> allBanners = [];
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final PageController pageController = PageController();
  final ScrollController scrollController = ScrollController();

  List<String> allLevelsTitle = [];

  List<int>? allLevelsId = [];

  String screenTitles(context, index) {
    switch (index) {
      case 0:
        return AppString.translate('studentHomeHomepageText', context);
      case 1:
        return AppString.translate('studentHomeMyCoursesText', context);
      case 2:
        return AppString.translate('studentHomeNotificationText', context);
      default:
        return '';
    }
  }


  ///
  ///

  BaseBloc(
    this.getDataSharedPrefsUseCase,
    this.setDataSharedPrefsUseCase,
  ) : super(const BaseState()) {
    on<GetIsLoggedEvent>(_getIsLogged);
    on<GetUserDataEvent>(_getUserData);


  }

  _getIsLogged(GetIsLoggedEvent event, Emitter<BaseState> emit) async {
    emit(state.copyWith(
      sharedPrefsState: SharedPrefsState.loading,
    ));
    final result = await getDataSharedPrefsUseCase(
        SharedPrefsGetParams(key: AppString.userLogged));
    result.fold(
        (l) => emit(state.copyWith(
              sharedPrefsState: SharedPrefsState.error,
            )), (r) {
      emit(state.copyWith(
        sharedPrefsState: SharedPrefsState.loaded,
        isLogged: r == 'true' ? true : false,
      ));
    });
  }

  _getUserData(GetUserDataEvent event, Emitter<BaseState> emit) async {
    emit(state.copyWith(
      sharedPrefsState: SharedPrefsState.loading,
    ));
    final result = await getDataSharedPrefsUseCase(
        SharedPrefsGetParams(key: AppString.userData));
    result.fold(
        (l) => emit(state.copyWith(
              sharedPrefsState: SharedPrefsState.error,
            )), (r) {
      dynamic userDataMap = json.decode(r);
log(r.toString());
      emit(state.copyWith(
          sharedPrefsState: SharedPrefsState.loaded,
          boardingUserData: LoginEntity.fromJson(userDataMap)));
    });
  }


}
