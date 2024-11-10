import 'package:shared_preferences/shared_preferences.dart';

abstract class BaseAuthenticationLocalDataSource {}

class AuthenticationLocalDataSource
    implements BaseAuthenticationLocalDataSource {
  final SharedPreferences sharedPreferences;

  AuthenticationLocalDataSource(this.sharedPreferences);
}
