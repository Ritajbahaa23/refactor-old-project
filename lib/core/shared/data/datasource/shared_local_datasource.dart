import 'package:shared_preferences/shared_preferences.dart';

abstract class BaseSharedLocalDataSource {
  Future getDataFromSharedPreference({required String key});

  Future<bool> saveDataSharedPreference(
      {required String key, required dynamic value});

  Future<bool> removeData({required String key});

  Future<bool> clearData();
}

class SharedLocalDataSource
    implements BaseSharedLocalDataSource {
  final SharedPreferences sharedPreferences;

  SharedLocalDataSource(this.sharedPreferences);

  @override
  Future<bool> saveDataSharedPreference(
      {required String key, required value}) async {
    if (value is bool) {
      return await sharedPreferences.setBool(key, value);
    } else if (value is String) {
      return await sharedPreferences.setString(key, value);
    } else if (value is int) {
      return await sharedPreferences.setInt(key, value);
    } else {
      return await sharedPreferences.setDouble(key, value);
    }
  }

  @override
  Future<bool> removeData({required String key}) async {
    return await sharedPreferences.remove(key);
  }

  @override
  Future<bool> clearData() async {
    return await sharedPreferences.clear();
  }

  @override
  Future getDataFromSharedPreference({required String key}) async {
    return sharedPreferences.get(key);
  }
}
