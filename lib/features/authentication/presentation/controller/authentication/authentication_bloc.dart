import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:climatify/core/error/exceptions.dart';
import 'package:climatify/core/shared/domain/usecase/clear_data_sharedprefs_usecase.dart';
import 'package:climatify/core/shared/domain/usecase/get_data_sharedprefs_usecase.dart';
import 'package:climatify/core/shared/domain/usecase/save_data_sharedprefs_usecase.dart';
import 'package:climatify/core/styles/app_string.dart';
import 'package:climatify/core/usecase/base_usecase.dart';
import 'package:climatify/core/utils/enums.dart';
import 'package:climatify/features/authentication/domain/usecases/resend_verify_code_usecase.dart';
import 'package:country_state_city/country_state_city.dart'
    as country_state_city;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../../core/shared/domain/entities/login_entity.dart';
import '../../../../../core/styles/colors.dart';
import '../../../domain/usecases/confirm_forget_password_usecase.dart';
import '../../../domain/usecases/forget_password_usecase.dart';
import '../../../domain/usecases/login_usecase.dart';
import '../../../domain/usecases/register_usecase.dart';
import '../../../domain/usecases/verify_code_usecase.dart';
import 'authentication_events.dart';
import 'authentication_states.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvents, AuthenticationStates> {
  final LoginUseCase loginUseCase;
  final SetDataSharedPrefsUseCase setDataSharedPrefsUseCase;
  final GetDataSharedPrefsUseCase getDataSharedPrefsUseCase;
  final ClearDataSharedPrefsUseCase clearDataSharedPrefsUseCase;
  final RegisterUseCase registerUseCase;
  final VerifyCodeUseCase verifyCodeUseCase;
  final ResendVerifyCodeUseCase resendVerifyCodeUseCase;
  final ForgetPasswordUseCase forgetPasswordUseCase;
  final ConfirmForgetPasswordUseCase confirmForgetPasswordUseCase;

  final loginEmailController = TextEditingController();

  final loginPasswordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  List<String> gender = [
    'Male',
    'Female',
  ];

  //////////////////////////////////////////////////////////////////////////////
  /// REGISTER FORM VARS.
  final registerFirstNameController = TextEditingController();
  final registerLastNameController = TextEditingController();
  final registerEmailController = TextEditingController();
  final registerUsernameController = TextEditingController();
  final registerPhoneController = TextEditingController();
  final registerPasswordController = TextEditingController();
  final registerDateOfBirthController = TextEditingController();
  final registerFormKey = GlobalKey<FormState>();

  //////////////////////////////////////////////////////////////////////////////

  //////////////////////////////////////////////////////////////////////////////
  /// ForgetPassword FORM VARS.
  final forgetPasswordEmailController = TextEditingController();
  final forgetPasswordCodeController = TextEditingController();
  final forgetPasswordPasswordController = TextEditingController();
  final forgetPasswordFormKey = GlobalKey<FormState>();

  //////////////////////////////////////////////////////////////////////////////

  AuthenticationBloc(
    this.loginUseCase,
    this.setDataSharedPrefsUseCase,
    this.getDataSharedPrefsUseCase,
    this.clearDataSharedPrefsUseCase,
    this.registerUseCase,
    this.verifyCodeUseCase,
    this.forgetPasswordUseCase,
    this.confirmForgetPasswordUseCase,
    this.resendVerifyCodeUseCase,
  ) : super(const AuthenticationStates()) {
    on<LoginEvent>(_login);
    on<SuffixEvent>(_changePasswordOneVisibility);
    on<RegisterEvent>(_register);
    on<SuffixTwoEvent>(_changePasswordTwoVisibility);
    on<GenderTypeChangeEvent>(_changeGenderType);
    on<GetCountriesEvent>(_getCountries);
    on<GetStatesEvent>(_getStates);
    on<GetCitiesEvent>(_getCities);
    on<ForgetPasswordEvent>(_forgetPassword);

    on<GenderChangeEvent>((event, emit) {
      _changeGender(event, emit, event.newValue);
    });
    on<TabBarIndexEvent>((event, emit) {
      _changeTabBarIndex(event, emit, event.index);
    });
    on<ChangeCountryEvent>((event, emit) {
      _changeCountry(event, emit, event.phoneCode, event.phoneExample);
    });
    on<GetStatesByCodeEvent>((event, emit) async {
      await _getStatesByCode(
        event,
        emit,
        event.countryCode,
      );
    });
    on<GetCityByCodeEvent>((event, emit) async {
      await _getCitiesByCode(event, emit, event.countryCode, event.stateCode);
    });
    on<SetSelectedCountryEvent>((event, emit) async {
      await _setSelectedCountry(event, emit, event.country);
    });
    on<SetSelectedStateEvent>((event, emit) async {
      await _setSelectedState(event, emit, event.state);
    });
    on<SetSelectedCityEvent>((event, emit) async {
      await _setSelectedCity(event, emit, event.city);
    });
    on<SelectDateTimeEvent>((event, emit) async {
      await _selectDateTime(event, emit, event.context);
    });
    on<VerifyCodeEvent>((event, emit) async {
      await _verifyCode(event, emit, event.code, event.username);
    });
    on<ResendVerifyCodeEvent>((event, emit) async {
      await _resendVerifyCode(
        event,
        emit,
        event.username,
      );
    });
    on<ChangeVerifyCodeEvent>((event, emit) async {
      await _changeVerifyCode(event, emit, event.code);
    });
    on<ConfirmForgetPasswordEvent>((event, emit) async {
      await _confirmForgetPassword(event, emit, event.email);
    });
    on<ChangeConfirmCodeEvent>((event, emit) async {
      await _changeConfirmCode(event, emit, event.code);
    });
  }

  FutureOr<void> _login(
      LoginEvent event, Emitter<AuthenticationStates> emit) async {
    try {
      emit(state.copyWith(
        loginState: RequestState.loading,
      ));
      final result = await loginUseCase(LoginParams(
          username: loginEmailController.text,
          password: loginPasswordController.text));
      result.fold(
        (l) => emit(state.copyWith(
          loginState: RequestState.error,
          loginMessage: l.message,
        )),
        (r) => emit(state.copyWith(
          login: r,
          loginState: RequestState.loaded,
          loginMessage: r.message,
        )),
      );
      // Convert user data to JSON string
      final userDataJsonString = json.encode(state.login.toJson());
      // Cache the user data after successful login
      await setDataSharedPrefsUseCase(SharedPrefsSetParams(
        key: AppString.userData,
        value: userDataJsonString, // Pass JSON string instead of Map
      ));
      await setDataSharedPrefsUseCase(SharedPrefsSetParams(
        key: AppString.userLogged,
        value: 'true', // Pass JSON string instead of Map
      ));
      final result2 = await getDataSharedPrefsUseCase(
          SharedPrefsGetParams(key: AppString.userData));
      result2.fold(
          (l) => emit(state.copyWith(
                sharedPrefsState: SharedPrefsState.error,
              )), (r) {
        Map<String, dynamic> userDataMap = json.decode(r);

        emit(state.copyWith(
          sharedPrefsState: SharedPrefsState.loaded,
          loginUserData: LoginEntity.fromJson(userDataMap),
        ));
      });
      log(state.sharedPrefsValue.toString());
    } catch (e) {
      if (e is ServerException) {
        emit(state.copyWith(
          loginState: RequestState.error,
          loginMessage: e.errorMessageModel.message,
        ));
        final failureMessage = e.errorMessageModel.message;
        if (kDebugMode) {
          log('Login failed with server error: $failureMessage');
        }
        emit(state.copyWith(
          loginState: RequestState.error,
          loginMessage: failureMessage,
        ));
      } else if (e is UnexpectedException) {
        emit(state.copyWith(
            loginState: RequestState.error,
            loginMessage: e.message.toString()));
        if (kDebugMode) {
          log('UnexpectedException error during Login: ${e.message.toString()}');
        }
      } else if (e is ValidationException) {
        emit(state.copyWith(
          loginState: RequestState.error,
          loginMessage: e.errorModel.error!.toString(),
        ));
        if (kDebugMode) {
          log('ValidationException error during Login: ${e.errorModel.error!.toString()}');
        }
      } else {
        emit(state.copyWith(
          loginState: RequestState.error,
        ));
        if (kDebugMode) {
          log('Unexpected error during Login: ${e.toString()}');
        }
      }
    }
  }

  _changePasswordOneVisibility(
      SuffixEvent event, Emitter<AuthenticationStates> emit) {
    ///UPDATE STATE VALUES OF THE PASSWORD VISIBILITY
    emit(state.copyWith(
      suffixState: state.suffixState == SuffixState.nonVisible
          ? SuffixState.visible
          : SuffixState.nonVisible,
      suffixOne: state.isPasswordOne
          ? Icons.visibility_outlined
          : Icons.visibility_off_outlined,
      isPasswordOne: !state.isPasswordOne,
    ));
  }

  _selectDateTime(SelectDateTimeEvent event, Emitter<AuthenticationStates> emit,
      BuildContext context) async {
    ///UPDATE STATE VALUES OF THE PASSWORD VISIBILITY
    await showDatePicker(
      barrierColor: AppColor.white,
      context: context,
      firstDate: DateTime(1900),
      lastDate: DateTime(2025),
    ).then((value) {
      final DateFormat formatter = DateFormat('yyyy-MM-dd');
      final String formatted = formatter.format(value!);
      registerDateOfBirthController.text = formatted;
      
      // '${value!.year}-${value.month}-${value.day}';
      emit(state.copyWith(
        selectedDateTime: formatted,
      ));
    });
  }

  _changeCountry(
    ChangeCountryEvent event,
    Emitter<AuthenticationStates> emit,
    String phoneCode,
    String phoneExample,
  ) {
    ///UPDATE STATE VALUES OF THE COUNTRY
    emit(state.copyWith(
      phoneCode: phoneCode,
      phoneExample: phoneExample,
    ));
  }

  _getCountries(
    GetCountriesEvent event,
    Emitter<AuthenticationStates> emit,
  ) async {
    ///UPDATE STATE VALUES OF THE COUNTRY
    await country_state_city.getAllCountries().then((value) {
      emit(state.copyWith(
        countriesList: value,
      ));
    });
  }

  _getStates(
    GetStatesEvent event,
    Emitter<AuthenticationStates> emit,
  ) async {
    ///UPDATE STATE VALUES OF THE COUNTRY
    await country_state_city.getAllStates().then((value) {
      emit(state.copyWith(
        statesList: value,
      ));
    });
  }

  _getCities(
    GetCitiesEvent event,
    Emitter<AuthenticationStates> emit,
  ) async {
    ///UPDATE STATE VALUES OF THE COUNTRY
    await country_state_city.getAllCities().then((value) {
      emit(state.copyWith(
        citiesList: value,
      ));
    });
  }

  _getStatesByCode(
    GetStatesByCodeEvent event,
    Emitter<AuthenticationStates> emit,
    String countryCode,
  ) async {
    List<country_state_city.State> otherStates = [];
    otherStates.add(country_state_city.State(
      name: 'Other',
      countryCode: '',
      isoCode: '',
      latitude: '',
      longitude: '',
    ));

    ///UPDATE STATE VALUES OF THE COUNTRY
    await country_state_city.getStatesOfCountry(countryCode).then((value) {
      emit(state.copyWith(
        statesList: value.isEmpty ? otherStates : value,
      ));
    });
  }

  _getCitiesByCode(
    GetCityByCodeEvent event,
    Emitter<AuthenticationStates> emit,
    String countryCode,
    String stateCode,
  ) async {
    List<country_state_city.City> otherList = [];
    otherList.add(
        country_state_city.City(name: 'Other', countryCode: '', stateCode: ''));

    ///UPDATE STATE VALUES OF THE COUNTRY
    await country_state_city
        .getStateCities(countryCode, stateCode)
        .then((value) {
      emit(state.copyWith(
        citiesList: value.isEmpty ? otherList : value,
      ));
    });
  }

  _setSelectedCountry(
    SetSelectedCountryEvent event,
    Emitter<AuthenticationStates> emit,
    String country,
  ) {
    ///UPDATE STATE VALUES OF THE COUNTRY
    emit(state.copyWith(
      selectedCountry: country,
    ));
  }

  _setSelectedState(
    SetSelectedStateEvent event,
    Emitter<AuthenticationStates> emit,
    String selectedState,
  ) {
    ///UPDATE STATE VALUES OF THE COUNTRY
    emit(state.copyWith(
      selectedState: selectedState,
    ));
  }

  _setSelectedCity(
    SetSelectedCityEvent event,
    Emitter<AuthenticationStates> emit,
    String city,
  ) {
    ///UPDATE STATE VALUES OF THE COUNTRY
    emit(state.copyWith(
      selectedCity: city,
    ));
  }

  ///REGISTER FUNCTION.
  FutureOr<void> _register(
      RegisterEvent event, Emitter<AuthenticationStates> emit) async {
    try {
      emit(state.copyWith(
        registerState: RequestState.loading,
      ));
      log('username: ${registerUsernameController.text}');
      log('password: ${registerPasswordController.text}');
      log('email: ${registerEmailController.text}');
      log('firstName: ${registerFirstNameController.text}');
      log('lastName: ${registerLastNameController.text}');
      log('nationality: ${state.selectedCountry.toString()}');
      log('country: ${state.selectedCountry.toString()}');
      log('city: ${state.selectedCity.toString()}');
      log('affiliation: ${state.selectedGender}');
      log('dateOfBirth: ${registerDateOfBirthController.text}');
      log('phone: +${state.phoneCode}${registerPhoneController.text}');

      final result = await registerUseCase(RegisterParams(
        username: registerUsernameController.text,
        password: registerPasswordController.text,
        email: registerEmailController.text,
        firstName: registerFirstNameController.text,
        lastName: registerLastNameController.text,
        nationality: state.selectedCountry.toString(),
        country: state.selectedCountry.toString(),
        city: state.selectedCity.toString(),
        affiliation: state.selectedGender,
        dateOfBirth: registerDateOfBirthController.text,
        phone: '+${state.phoneCode}${registerPhoneController.text}',
      ));
      result.fold(
        (l) => emit(state.copyWith(
          registerState: RequestState.error,
          registerMessage: l.message,
        )),
        (r) => emit(state.copyWith(
          registerState: RequestState.loaded,
          registerMessage: r.message,
        )),
      );
    } catch (e) {
      if (e is ServerException) {
        emit(state.copyWith(
          registerState: RequestState.error,
          registerMessage: e.errorMessageModel.message,
        ));
        final failureMessage = e.errorMessageModel.message;
        if (kDebugMode) {
          log('_register failed with server error: $failureMessage');
        }
        emit(state.copyWith(
          registerState: RequestState.error,
          registerMessage: failureMessage,
        ));
      } else if (e is UnexpectedException) {
        emit(state.copyWith(
            registerState: RequestState.error,
            registerMessage: e.message.toString()));
        if (kDebugMode) {
          log('UnexpectedException error during _register: ${e.message.toString()}');
        }
      } else {
        emit(state.copyWith(
          registerState: RequestState.error,
        ));
        if (kDebugMode) {
          log('Unexpected error during _register: ${e.toString()}');
        }
      }
    }
  }

  _changePasswordTwoVisibility(
      SuffixTwoEvent event, Emitter<AuthenticationStates> emit) {
    ///UPDATE STATE VALUES OF THE PASSWORD VISIBILITY
    emit(state.copyWith(
      suffixTwoState: state.suffixTwoState == SuffixState.nonVisible
          ? SuffixState.visible
          : SuffixState.nonVisible,
      suffixTwo: state.isPasswordTwo ? Icons.visibility : Icons.visibility_off,
      isPasswordTwo: !state.isPasswordTwo,
    ));
  }

  _changeGender(GenderChangeEvent event, Emitter<AuthenticationStates> emit,
      String newValue) {
    ///UPDATE STATE VALUES OF THE Type state
    emit(state.copyWith(
      genderTypes: newValue,
    ));
  }

  _changeGenderType(
      GenderTypeChangeEvent event, Emitter<AuthenticationStates> emit) {
    ///UPDATE STATE VALUES OF THE Type state
    emit(state.copyWith(
      isFemale: !state.isFemale,
    ));
  }

  _changeTabBarIndex(
      TabBarIndexEvent event, Emitter<AuthenticationStates> emit, int index) {
    ///UPDATE STATE VALUES OF THE Type state
    emit(
      state.copyWith(
        tabBarIndex: index,
      ),
    );
  }

  FutureOr<void> _verifyCode(VerifyCodeEvent event,
      Emitter<AuthenticationStates> emit, String code, String username) async {
    try {
      emit(state.copyWith(
        verifyCodeState: RequestState.loading,
      ));
      final result = await verifyCodeUseCase(
        VerifyCodeParams(
          username: username,
          code: code,
        ),
      );
      result.fold(
        (l) => emit(state.copyWith(
          verifyCodeState: RequestState.error,
          verifyCodeMessage: l.message,
        )),
        (r) => emit(state.copyWith(
          verifyCodeState: RequestState.loaded,
          verifyCodeMessage: r.message,
        )),
      );
    } catch (e) {
      if (e is ServerException) {
        emit(state.copyWith(
          verifyCodeState: RequestState.error,
          verifyCodeMessage: e.errorMessageModel.message,
        ));
        final failureMessage = e.errorMessageModel.message;
        if (kDebugMode) {
          log('_verifyCode failed with server error: $failureMessage');
        }
        emit(state.copyWith(
          verifyCodeState: RequestState.error,
          verifyCodeMessage: failureMessage,
        ));
      } else if (e is UnexpectedException) {
        emit(state.copyWith(
            verifyCodeState: RequestState.error,
            verifyCodeMessage: e.message.toString()));
        if (kDebugMode) {
          log('UnexpectedException error during _verifyCode: ${e.message.toString()}');
        }
      } else {
        emit(state.copyWith(
          verifyCodeState: RequestState.error,
        ));
        if (kDebugMode) {
          log('Unexpected error during _verifyCode: ${e.toString()}');
        }
      }
    }
  }

  FutureOr<void> _resendVerifyCode(ResendVerifyCodeEvent event,
      Emitter<AuthenticationStates> emit, String username) async {
    try {
      emit(state.copyWith(
        resendVerifyCodeState: RequestState.loading,
      ));
      final result = await resendVerifyCodeUseCase(
        ResendVerifyCodeParams(
          username: username,
        ),
      );
      result.fold(
        (l) => emit(state.copyWith(
          resendVerifyCodeState: RequestState.error,
          resendVerifyCodeMessage: l.message,
        )),
        (r) => emit(state.copyWith(
          resendVerifyCodeState: RequestState.loaded,
          resendVerifyCodeMessage: r.message,
        )),
      );
    } catch (e) {
      if (e is ServerException) {
        emit(state.copyWith(
          resendVerifyCodeState: RequestState.error,
          resendVerifyCodeMessage: e.errorMessageModel.message,
        ));
        final failureMessage = e.errorMessageModel.message;
        if (kDebugMode) {
          log('_resendVerifyCode failed with server error: $failureMessage');
        }
        emit(state.copyWith(
          resendVerifyCodeState: RequestState.error,
          resendVerifyCodeMessage: failureMessage,
        ));
      } else if (e is UnexpectedException) {
        emit(state.copyWith(
            resendVerifyCodeState: RequestState.error,
            resendVerifyCodeMessage: e.message.toString()));
        if (kDebugMode) {
          log('UnexpectedException error during _resendVerifyCode: ${e.message.toString()}');
        }
      } else {
        emit(state.copyWith(
          resendVerifyCodeState: RequestState.error,
        ));
        if (kDebugMode) {
          log('Unexpected error during _resendVerifyCode: ${e.toString()}');
        }
      }
    }
  }

  _changeVerifyCode(ChangeVerifyCodeEvent event,
      Emitter<AuthenticationStates> emit, String code) {
    ///UPDATE STATE VALUES OF THE Type state
    emit(
      state.copyWith(
        verifyCode: code,
      ),
    );
  }

  FutureOr<void> _forgetPassword(
      ForgetPasswordEvent event, Emitter<AuthenticationStates> emit) async {
    try {
      emit(state.copyWith(
        forgetPasswordState: RequestState.loading,
      ));
      final result = await forgetPasswordUseCase(
        ForgetPasswordParams(email: forgetPasswordEmailController.text),
      );
      result.fold(
        (l) => emit(state.copyWith(
          forgetPasswordState: RequestState.error,
          forgetPasswordMessage: l.message,
        )),
        (r) => emit(state.copyWith(
          forgetPasswordState: RequestState.loaded,
          forgetPasswordMessage: r.message,
        )),
      );
    } catch (e) {
      if (e is ServerException) {
        emit(state.copyWith(
          forgetPasswordState: RequestState.error,
          forgetPasswordMessage: e.errorMessageModel.message,
        ));
        final failureMessage = e.errorMessageModel.message;
        if (kDebugMode) {
          log('_forgetPassword failed with server error: $failureMessage');
        }
        emit(state.copyWith(
          forgetPasswordState: RequestState.error,
          forgetPasswordMessage: failureMessage,
        ));
      } else if (e is UnexpectedException) {
        emit(state.copyWith(
            forgetPasswordState: RequestState.error,
            forgetPasswordMessage: e.message.toString()));
        if (kDebugMode) {
          log('UnexpectedException error during _forgetPassword: ${e.message.toString()}');
        }
      } else {
        emit(state.copyWith(
          forgetPasswordState: RequestState.error,
        ));
        if (kDebugMode) {
          log('Unexpected error during _forgetPassword: ${e.toString()}');
        }
      }
    }
  }

  FutureOr<void> _confirmForgetPassword(
    ConfirmForgetPasswordEvent event,
    Emitter<AuthenticationStates> emit,
    String email,
  ) async {
    try {
      emit(state.copyWith(
        confirmForgetPasswordState: RequestState.loading,
      ));
      final result = await confirmForgetPasswordUseCase(
        ConfirmForgetPasswordParams(
          email: email,
          code: state.verifyCode,
          password: forgetPasswordPasswordController.text,
        ),
      );
      result.fold(
        (l) => emit(state.copyWith(
          confirmForgetPasswordState: RequestState.error,
          confirmForgetPasswordMessage: l.message,
        )),
        (r) => emit(state.copyWith(
          confirmForgetPasswordState: RequestState.loaded,
          confirmForgetPasswordMessage: r.message,
        )),
      );
    } catch (e) {
      if (e is ServerException) {
        emit(state.copyWith(
          confirmForgetPasswordState: RequestState.error,
          confirmForgetPasswordMessage: e.errorMessageModel.message,
        ));
        final failureMessage = e.errorMessageModel.message;
        if (kDebugMode) {
          log('_confirmForgetPassword failed with server error: $failureMessage');
        }
        emit(state.copyWith(
          confirmForgetPasswordState: RequestState.error,
          confirmForgetPasswordMessage: failureMessage,
        ));
      } else if (e is UnexpectedException) {
        emit(state.copyWith(
            confirmForgetPasswordState: RequestState.error,
            confirmForgetPasswordMessage: e.message.toString()));
        if (kDebugMode) {
          log('UnexpectedException error during _confirmForgetPassword: ${e.message.toString()}');
        }
      } else {
        emit(state.copyWith(
          confirmForgetPasswordState: RequestState.error,
        ));
        if (kDebugMode) {
          log('Unexpected error during _confirmForgetPassword: ${e.toString()}');
        }
      }
    }
  }

  _changeConfirmCode(ChangeConfirmCodeEvent event,
      Emitter<AuthenticationStates> emit, String code) {
    ///UPDATE STATE VALUES OF THE Type state
    emit(
      state.copyWith(
        verifyCode: code,
      ),
    );
  }
}
