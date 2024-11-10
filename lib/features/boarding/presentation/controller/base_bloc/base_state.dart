import 'package:climatify/core/shared/domain/entities/login_entity.dart';
import 'package:climatify/core/utils/enums.dart';
import 'package:equatable/equatable.dart';

class BaseState extends Equatable {
  final SharedPrefsState sharedPrefsState;
  final bool getLocal;
  final String sharedPrefsValue;
  final LoginEntity boardingUserData;
  final bool isLogged;
  final bool switchValue;
  final bool setLocal;
  final String currentLocal;

  ///
  /////////////////////////////////////////////////////////////////////
  ///
  ///
  const BaseState({
    this.sharedPrefsState = SharedPrefsState.loading,
    this.sharedPrefsValue = '',
    this.boardingUserData = const LoginEntity(
      success: false,
      message: '',
      loginData: LoginData(
        idToken: '',
        accessToken: '',
        refreshToken: '',
      ),
    ),
    this.isLogged = false,
    this.currentLocal = '',
    this.getLocal = false,
    this.switchValue = false,
    this.setLocal = false,
  });

  BaseState copyWith({
    SharedPrefsState? sharedPrefsState,
    String? sharedPrefsValue,
    LoginEntity? boardingUserData,
    bool? isLogged,
    bool? getLocal,
    String? currentLocal,
    bool? switchValue,
    bool? setLocal,
  }) {
    return BaseState(
      sharedPrefsState: sharedPrefsState ?? this.sharedPrefsState,
      sharedPrefsValue: sharedPrefsValue ?? this.sharedPrefsValue,
      boardingUserData: boardingUserData ?? this.boardingUserData,
      isLogged: isLogged ?? this.isLogged,
      getLocal: getLocal ?? this.getLocal,
      currentLocal: currentLocal ?? this.currentLocal,
      switchValue: switchValue ?? this.switchValue,
      setLocal: setLocal ?? this.setLocal,
    );
  }

  @override
  List<Object> get props => [
        sharedPrefsState,
        getLocal,
        sharedPrefsValue,
        boardingUserData,
        isLogged,
        switchValue,
        setLocal,
        currentLocal,
      ];
}
