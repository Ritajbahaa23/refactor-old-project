import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class AuthenticationEvents extends Equatable {
  const AuthenticationEvents();

  @override
  List<Object> get props => [];
}

class LoginEvent extends AuthenticationEvents {}

class SuffixEvent extends AuthenticationEvents {}

class SelectDateTimeEvent extends AuthenticationEvents {
  final BuildContext context;

  const SelectDateTimeEvent(this.context);

  @override
  List<Object> get props => [context];
}

class RegisterEvent extends AuthenticationEvents {}

class SuffixOneEvent extends AuthenticationEvents {}

class SuffixTwoEvent extends AuthenticationEvents {}

class GenderChangeEvent extends AuthenticationEvents {
  final String newValue;

  const GenderChangeEvent(this.newValue);

  @override
  List<Object> get props => [newValue];
}

class TabBarIndexEvent extends AuthenticationEvents {
  final int index;

  const TabBarIndexEvent(this.index);

  @override
  List<Object> get props => [index];
}

class GenderTypeChangeEvent extends AuthenticationEvents {}

class ChangeCountryEvent extends AuthenticationEvents {
  final String phoneCode;
  final String phoneExample;

  const ChangeCountryEvent(this.phoneCode, this.phoneExample);

  @override
  List<Object> get props => [phoneCode, phoneExample];
}

class GetCountriesEvent extends AuthenticationEvents {}

class GetStatesEvent extends AuthenticationEvents {}

class GetCitiesEvent extends AuthenticationEvents {}

class GetStatesByCodeEvent extends AuthenticationEvents {
  final String countryCode;

  const GetStatesByCodeEvent(
    this.countryCode,
  );

  @override
  List<Object> get props => [countryCode];
}

class GetCityByCodeEvent extends AuthenticationEvents {
  final String countryCode;
  final String stateCode;

  const GetCityByCodeEvent(
    this.countryCode,
    this.stateCode,
  );

  @override
  List<Object> get props => [countryCode, stateCode];
}

class SetSelectedCountryEvent extends AuthenticationEvents {
  final String country;

  const SetSelectedCountryEvent(
    this.country,
  );

  @override
  List<Object> get props => [country];
}

class SetSelectedStateEvent extends AuthenticationEvents {
  final String state;

  const SetSelectedStateEvent(
    this.state,
  );

  @override
  List<Object> get props => [state];
}

class SetSelectedCityEvent extends AuthenticationEvents {
  final String city;

  const SetSelectedCityEvent(
    this.city,
  );

  @override
  List<Object> get props => [city];
}

class VerifyCodeEvent extends AuthenticationEvents {
  final String code;
  final String username;

  const VerifyCodeEvent(
    this.code,
    this.username,
  );

  @override
  List<Object> get props => [code, username];
}

class ChangeVerifyCodeEvent extends AuthenticationEvents {
  final String code;

  const ChangeVerifyCodeEvent(
    this.code,
  );

  @override
  List<Object> get props => [code];
}

class ForgetPasswordEvent extends AuthenticationEvents {}

class ConfirmForgetPasswordEvent extends AuthenticationEvents {
  final String email;

  const ConfirmForgetPasswordEvent(
    this.email,
  );

  @override
  List<Object> get props => [email];
}

class ChangeConfirmCodeEvent extends AuthenticationEvents {
  final String code;

  const ChangeConfirmCodeEvent(
    this.code,
  );

  @override
  List<Object> get props => [code];
}

class ResendVerifyCodeEvent extends AuthenticationEvents {
  final String username;

  const ResendVerifyCodeEvent(
    this.username,
  );

  @override
  List<Object> get props => [username];
}
