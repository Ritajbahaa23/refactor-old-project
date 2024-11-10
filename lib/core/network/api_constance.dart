class ApiConstants {
  static const String domain = 'http://192.168.1.39:3000';
  static const String baseURL = '$domain/api/v1';
  static const String loginPath = '$baseURL/login';
  static const String registerPath = '$baseURL/register';
  static const String verifyEmailPath = '$baseURL/verifyEmail';
  static const String resendVerifyEmailPath = '$baseURL/resendVerificationCode';
  static const String forgetPasswordPath = '$baseURL/forgotCredentials';
  static const String confirmForgetPasswordPath = '$baseURL/confirmForgotCredentials';
  static const String googleAuthPath = '$baseURL/google-auth';
  static const String getPostsPath = '$baseURL/posts';
  static const String getStoriesPath = '$baseURL/stories';
  static const String baseImageUrl = '$domain/';
  static String imageUrl(String path) => '$baseImageUrl$path';
}
