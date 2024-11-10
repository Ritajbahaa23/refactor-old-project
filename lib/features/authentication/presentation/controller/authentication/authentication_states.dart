import 'package:climatify/core/utils/enums.dart';
import 'package:country_state_city/country_state_city.dart'
    as country_state_city;
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../../core/shared/domain/entities/login_entity.dart';

class AuthenticationStates extends Equatable {
  final LoginEntity login;
  final RequestState loginState;
  final SharedPrefsState sharedPrefsState;
  final LoginEntity loginUserData;
  final String sharedPrefsValue;
  final String loginMessage;
  final SuffixState suffixState;
  final IconData suffixOne;
  final bool isPasswordOne;
  final bool isRemembered;

  final RequestState registerState;
  final String registerMessage;

  final String selectedGender;
  final SuffixState suffixOneState;
  final SuffixState suffixTwoState;
  final IconData suffixTwo;
  final bool isPasswordTwo;
  final bool isFemale;

  final int tabBarIndex;

  final String phoneCode;
  final String phoneExample;
  final List<country_state_city.Country> countriesList;
  final List<country_state_city.State> statesList;
  final List<country_state_city.City> citiesList;
  final String selectedCountry;
  final String selectedState;
  final String selectedCity;
  final String selectedDateTime;

  final RequestState verifyCodeState;
  final String verifyCodeMessage;
  final RequestState resendVerifyCodeState;
  final String resendVerifyCodeMessage;
  final String verifyCode;
  final RequestState forgetPasswordState;
  final String forgetPasswordMessage;
  final RequestState confirmForgetPasswordState;
  final String confirmForgetPasswordMessage;
 final  bool isSignUpPresses;

  const AuthenticationStates({
    this.login = const LoginEntity(
      success: false,
      message: '',
      loginData: LoginData(
        idToken: '',
        accessToken: '',
        refreshToken: '',
      ),
    ),
    this.loginState = RequestState.initial,
    this.sharedPrefsState = SharedPrefsState.loading,
    this.loginMessage = '',
    this.suffixState = SuffixState.nonVisible,
    this.suffixOne = Icons.visibility_off_outlined,
    this.isPasswordOne = true,
    this.sharedPrefsValue = '',
    this.loginUserData = const LoginEntity(
      success: false,
      message: '',
      loginData: LoginData(
        idToken: '',
        accessToken: '',
        refreshToken: '',
      ),
    ),
    this.isRemembered = false,
    this.registerState = RequestState.initial,
    this.registerMessage = '',
    this.suffixOneState = SuffixState.nonVisible,
    this.suffixTwo = Icons.visibility_off,
    this.suffixTwoState = SuffixState.nonVisible,
    this.isPasswordTwo = true,
    this.isSignUpPresses = false,

    ///Change that for translation value from app strings
    this.selectedGender = '',

    ///Change that for translation value from app strings
    ///Change that for translation value from app strings
    this.isFemale = false,
    this.tabBarIndex = 0,
    this.phoneCode = '20',
    this.phoneExample = '1001234567',
    this.countriesList = const [],
    this.statesList = const [],
    this.citiesList = const [],
    this.selectedCountry = '',
    this.selectedState = '',
    this.selectedCity = '',
    this.selectedDateTime = '',
    this.verifyCodeState = RequestState.initial,
    this.verifyCodeMessage = '',
    this.resendVerifyCodeState = RequestState.initial,
    this.resendVerifyCodeMessage = '',
    this.verifyCode = '',
    this.forgetPasswordState = RequestState.initial,
    this.forgetPasswordMessage = '',
    this.confirmForgetPasswordState = RequestState.initial,
    this.confirmForgetPasswordMessage = '',
  });

  AuthenticationStates copyWith({
    LoginEntity? login,
    RequestState? loginState,
    SharedPrefsState? sharedPrefsState,
    String? loginMessage,
    String? sharedPrefsValue,
    SuffixState? suffixState,
    IconData? suffixOne,
    bool? isPasswordOne,
    LoginEntity? loginUserData,
    bool? isRemembered,
    RequestState? registerState,
    String? registerMessage,
    List<String>? codeList,
    String? genderTypes,
    SuffixState? suffixOneState,
    SuffixState? suffixTwoState,
    IconData? suffixTwo,
    bool? isPasswordTwo,
    bool? isFemale,
    List<String>? qrList,
    int? qrCount,
    String? selectedGender,
    int? tabBarIndex,
    String? phoneCode,
    String? phoneExample,
    List<country_state_city.Country>? countriesList,
    List<country_state_city.State>? statesList,
    List<country_state_city.City>? citiesList,
    String? selectedCountry,
    String? selectedState,
    String? selectedCity,
    String? selectedDateTime,
    RequestState? verifyCodeState,
    String? verifyCodeMessage,
    RequestState? resendVerifyCodeState,
    String? resendVerifyCodeMessage,
    String? verifyCode,
    RequestState? forgetPasswordState,
    String? forgetPasswordMessage,
    RequestState? confirmForgetPasswordState,
    String? confirmForgetPasswordMessage,
    bool? isSignUpPresses,
  }) {
    return AuthenticationStates(
        login: login ?? this.login,
        loginState: loginState ?? this.loginState,
        sharedPrefsState: sharedPrefsState ?? this.sharedPrefsState,
        loginMessage: loginMessage ?? this.loginMessage,
        suffixOne: suffixOne ?? this.suffixOne,
        suffixState: suffixState ?? this.suffixState,
        isPasswordOne: isPasswordOne ?? this.isPasswordOne,
        sharedPrefsValue: sharedPrefsValue ?? this.sharedPrefsValue,
        loginUserData: loginUserData ?? this.loginUserData,
        isRemembered: isRemembered ?? this.isRemembered,
        registerState: registerState ?? this.registerState,
        registerMessage: registerMessage ?? this.registerMessage,
        selectedGender: genderTypes ?? this.selectedGender,
        suffixOneState: suffixOneState ?? this.suffixOneState,
        suffixTwo: suffixTwo ?? this.suffixTwo,
        suffixTwoState: suffixTwoState ?? this.suffixTwoState,
        isPasswordTwo: isPasswordTwo ?? this.isPasswordTwo,
        isFemale: isFemale ?? this.isFemale,
        tabBarIndex: tabBarIndex ?? this.tabBarIndex,
        phoneCode: phoneCode ?? this.phoneCode,
        phoneExample: phoneExample ?? this.phoneExample,
        countriesList: countriesList ?? this.countriesList,
        statesList: statesList ?? this.statesList,
        citiesList: citiesList ?? this.citiesList,
        selectedCountry: selectedCountry ?? this.selectedCountry,
        selectedState: selectedState ?? this.selectedState,
        selectedCity: selectedCity ?? this.selectedCity,
        selectedDateTime: selectedDateTime ?? this.selectedDateTime,
        verifyCodeState: verifyCodeState ?? this.verifyCodeState,
        verifyCodeMessage: verifyCodeMessage ?? this.verifyCodeMessage,
        verifyCode: verifyCode ?? this.verifyCode,
        forgetPasswordState: forgetPasswordState ?? this.forgetPasswordState,
        forgetPasswordMessage:
            forgetPasswordMessage ?? this.forgetPasswordMessage,
        confirmForgetPasswordState:
            confirmForgetPasswordState ?? this.confirmForgetPasswordState,
        confirmForgetPasswordMessage:
            confirmForgetPasswordMessage ?? this.confirmForgetPasswordMessage,
        resendVerifyCodeState:
            resendVerifyCodeState ?? this.resendVerifyCodeState,
        resendVerifyCodeMessage:
            resendVerifyCodeMessage ?? this.resendVerifyCodeMessage,
        isSignUpPresses: isSignUpPresses ?? this.isSignUpPresses);
  }

  @override
  List<Object> get props => [
        login,
        loginState,
        sharedPrefsState,
        loginUserData,
        sharedPrefsValue,
        loginMessage,
        suffixState,
        suffixOne,
        isPasswordOne,
        isRemembered,
        registerState,
        registerMessage,
        selectedGender,
        suffixOneState,
        suffixTwoState,
        suffixTwo,
        isPasswordTwo,
        isFemale,
        tabBarIndex,
        phoneCode,
        phoneExample,
        countriesList,
        statesList,
        citiesList,
        selectedCountry,
        selectedState,
        selectedCity,
        selectedDateTime,
        verifyCodeState,
        verifyCodeMessage,
        resendVerifyCodeState,
        resendVerifyCodeMessage,
        verifyCode,
        forgetPasswordState,
        forgetPasswordMessage,
        confirmForgetPasswordState,
        confirmForgetPasswordMessage,
        isSignUpPresses
      ];
}
