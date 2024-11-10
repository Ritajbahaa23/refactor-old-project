import 'package:shared_preferences/shared_preferences.dart';

abstract class BaseHomeLocalDataSource {
}

class HomeLocalDataSource
    implements BaseHomeLocalDataSource {
  final SharedPreferences sharedPreferences;

  HomeLocalDataSource(this.sharedPreferences);

}
