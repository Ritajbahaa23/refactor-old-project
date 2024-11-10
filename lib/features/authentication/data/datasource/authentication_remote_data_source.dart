import 'dart:async';

import 'package:climatify/features/authentication/domain/entities/basic_enitty.dart';
import 'package:dio/dio.dart';
import 'package:climatify/core/error/exceptions.dart';
import 'package:climatify/core/network/api_constance.dart';
import 'package:climatify/core/network/error_message_model.dart';
import 'package:climatify/core/network/error_model.dart';

import '../../../../core/shared/data/models/login_model.dart';
import '../../domain/entities/google_auth_entity.dart';


abstract class BaseAuthenticationRemoteDataSource {
  Future<LoginModel> login({
    required String username,
    required String password,
  });

  Future<BasicEntity> register({
    required String email,
    required String password,
    required String username,
    required String firstName,
    required String lastName,
    required String affiliation,
    required String nationality,
    required String country,
    required String city,
    required String dateOfBirth,
    required String phone,
  });

  Future<BasicEntity> verifyCode({
    required String code,
    required String username,
  });
  Future<BasicEntity> resendVerification({
    required String username,
  });

  Future<BasicEntity> forgetPassword({
    required String email,
  });

  Future<BasicEntity> confirmForgetPassword({
    required String code,
    required String email,
    required String password,
  });
  Future<GoogleAuthEntity> googleAuth();

}

class AuthenticationRemoteDataSource
    implements BaseAuthenticationRemoteDataSource {
  @override
  Future<LoginModel> login({
    required String username,
    required String password,
  }) async {
    try {
      final response = await Dio().post(
        ApiConstants.loginPath,
        data: {'username': username, 'password': password},
      );
      // log('Login Path '+response.realUri.toString()+'Data '+response.data+'Headers '+response.headers.toString()+'StatusCode '+response.statusCode.toString()+'Status Message '+response.statusMessage.toString());
      if (response.statusCode == 200) {
        if (response.data['success'] == true) {
          return LoginModel.fromJson(response.data);
        } else {
          throw ServerException(
            errorMessageModel: ErrorMessageModel.fromJson(response.data),
          );
        }
      } else if (response.statusCode == 401) {
        // Handle validation errors
        throw ValidationException(
          errorModel: ErrorModel.fromJson(response.data),
        );
      } else {
        // Handle other server errors
        throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data),
        );
      }
    } catch (error) {
      if (error is DioError) {
        if (error.response != null && error.response!.statusCode == 422) {
          throw ValidationException(
            errorModel: ErrorModel.fromJson(error.response!.data),
          );
        } else {
          throw ServerException(
            errorMessageModel: ErrorMessageModel.fromJson(error.response!.data),
          );
        }
      } else if (error is ServerException) {
        rethrow;
      } else {
        throw UnexpectedException(
          message: error.toString(),
        );
      }
    }
  }

  @override
  Future<BasicEntity> register({
    required String email,
    required String password,
    required String username,
    required String firstName,
    required String lastName,
    required String affiliation,
    required String nationality,
    required String country,
    required String city,
    required String dateOfBirth,
    required String phone,
  }) async {
    try {
      final response = await Dio().post(
        ApiConstants.registerPath,
        data: {
          'email': email,
          'password': password,
          'username': username,
          'firstName': firstName,
          'lastName': lastName,
          'affiliation': affiliation,
          'nationality': nationality,
          'country': country,
          'city': city,
          'dateOfBirth': dateOfBirth,
          'phone': phone,
        },
      );
      // log('Login Path '+response.realUri.toString()+'Data '+response.data+'Headers '+response.headers.toString()+'StatusCode '+response.statusCode.toString()+'Status Message '+response.statusMessage.toString());
      if ((response.statusCode == 200) || (response.statusCode == 201)) {
        if (response.data['success'] == true) {
          return BasicEntity.fromJson(response.data);
        } else {
          throw ServerException(
            errorMessageModel: ErrorMessageModel.fromJson(response.data),
          );
        }
      } else {
        throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data),
        );
      }
    } catch (error) {
      if (error is DioError) {
        throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(error.response!.data),
        );
      } else if (error is ServerException) {
        rethrow;
      } else {
        throw UnexpectedException(
          message: error.toString(),
        );
      }
    }
  }

  @override
  Future<BasicEntity> verifyCode(
      {required String code, required String username}) async {
    try {
      final response = await Dio().post(
        ApiConstants.verifyEmailPath,
        data: {
          'code': code,
          'username': username,
        },
      );
      // log('Login Path '+response.realUri.toString()+'Data '+response.data+'Headers '+response.headers.toString()+'StatusCode '+response.statusCode.toString()+'Status Message '+response.statusMessage.toString());
      if ((response.statusCode == 200) || (response.statusCode == 201)) {
        if (response.data['success'] == true) {
          return BasicEntity.fromJson(response.data);
        } else {
          throw ServerException(
            errorMessageModel: ErrorMessageModel.fromJson(response.data),
          );
        }
      } else {
        throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data),
        );
      }
    } catch (error) {
      if (error is DioError) {
        throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(error.response!.data),
        );
      } else if (error is ServerException) {
        rethrow;
      } else {
        throw UnexpectedException(
          message: error.toString(),
        );
      }
    }
  }

  @override
  Future<BasicEntity> forgetPassword({required String email}) async {
    try {
      final response = await Dio().post(
        ApiConstants.forgetPasswordPath,
        data: {
          'email': email,
        },
      );
      // log('Login Path '+response.realUri.toString()+'Data '+response.data+'Headers '+response.headers.toString()+'StatusCode '+response.statusCode.toString()+'Status Message '+response.statusMessage.toString());
      if ((response.statusCode == 200) || (response.statusCode == 201)) {
        if (response.data['success'] == true) {
          return BasicEntity.fromJson(response.data);
        } else {
          throw ServerException(
            errorMessageModel: ErrorMessageModel.fromJson(response.data),
          );
        }
      } else {
        throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data),
        );
      }
    } catch (error) {
      if (error is DioError) {
        throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(error.response!.data),
        );
      } else if (error is ServerException) {
        rethrow;
      } else {
        throw UnexpectedException(
          message: error.toString(),
        );
      }
    }
  }

  @override
  Future<BasicEntity> confirmForgetPassword(
      {required String code,
      required String email,
      required String password}) async {
    try {
      final response = await Dio().post(
        ApiConstants.confirmForgetPasswordPath,
        data: {
          'code': code,
          'email': email,
          'password': password,
        },
      );
      // log('Login Path '+response.realUri.toString()+'Data '+response.data+'Headers '+response.headers.toString()+'StatusCode '+response.statusCode.toString()+'Status Message '+response.statusMessage.toString());
      if ((response.statusCode == 200) || (response.statusCode == 201)) {
        if (response.data['success'] == true) {
          return BasicEntity.fromJson(response.data);
        } else {
          throw ServerException(
            errorMessageModel: ErrorMessageModel.fromJson(response.data),
          );
        }
      } else {
        throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data),
        );
      }
    } catch (error) {
      if (error is DioError) {
        throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(error.response!.data),
        );
      } else if (error is ServerException) {
        rethrow;
      } else {
        throw UnexpectedException(
          message: error.toString(),
        );
      }
    }
  }

  @override
  Future<BasicEntity> resendVerification({required String username}) async {
    try {
      final response = await Dio().post(
        ApiConstants.resendVerifyEmailPath,
        data: {
          'username': username,
        },
      );
      // log('Login Path '+response.realUri.toString()+'Data '+response.data+'Headers '+response.headers.toString()+'StatusCode '+response.statusCode.toString()+'Status Message '+response.statusMessage.toString());
      if ((response.statusCode == 200) || (response.statusCode == 201)) {
        if (response.data['success'] == true) {
          return BasicEntity.fromJson(response.data);
        } else {
          throw ServerException(
            errorMessageModel: ErrorMessageModel.fromJson(response.data),
          );
        }
      } else {
        throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data),
        );
      }
    } catch (error) {
      if (error is DioError) {
        throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(error.response!.data),
        );
      } else if (error is ServerException) {
        rethrow;
      } else {
        throw UnexpectedException(
          message: error.toString(),
        );
      }
    }
  }

  Future<GoogleAuthEntity> googleAuth() async {
    try {
      final response = await Dio().get(
        ApiConstants.googleAuthPath,
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        }),
      );
      if ((response.statusCode == 200) || (response.statusCode == 201)) {
        if (response.data['success'] == true) {
          return GoogleAuthEntity.fromJson(response.data);
        } else {
          throw ServerException(
            errorMessageModel: ErrorMessageModel.fromJson(response.data),
          );
        }
      } else {
        throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data),
        );
      }
    } catch (error) {
      if (error is DioError) {
        throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(error.response!.data),
        );
      } else if (error is ServerException) {
        rethrow;
      } else {
        throw UnexpectedException(
          message: error.toString(),
        );
      }
    }
  }
}
