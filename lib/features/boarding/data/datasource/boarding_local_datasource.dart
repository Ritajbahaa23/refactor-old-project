import 'package:shared_preferences/shared_preferences.dart';

abstract class BaseBoardingLocalDataSource {}

class BoardingLocalDataSource implements BaseBoardingLocalDataSource {
  final SharedPreferences sharedPreferences;

  BoardingLocalDataSource(this.sharedPreferences);
}
