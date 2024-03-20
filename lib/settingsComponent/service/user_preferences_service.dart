import 'package:campus_flutter/base/enums/user_preference.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferencesService {
  final SharedPreferences sharedPreferences;

  UserPreferencesService(this.sharedPreferences);

  Object? load<T>(UserPreference userPreference) {
    if (userPreference.type == String) {
      return sharedPreferences.getString(userPreference.name);
    } else if (userPreference.type == int) {
      return sharedPreferences.getInt(userPreference.name);
    } else if (userPreference.type == bool) {
      return sharedPreferences.getBool(userPreference.name);
    } else if (userPreference.type == List<String>) {
      return sharedPreferences.getStringList(userPreference.name);
    } else {
      return sharedPreferences.get(userPreference.name);
    }
  }

  void save(UserPreference userPreference, Object? value) {
    if (userPreference.type == String && value is String) {
      sharedPreferences.setString(userPreference.name, value);
    } else if (userPreference.type == int && value is int) {
      sharedPreferences.setInt(userPreference.name, value);
    } else if (userPreference.type == bool && value is bool) {
      sharedPreferences.setBool(userPreference.name, value);
    } else if ((userPreference.type == List<String>) && value is List<String>) {
      sharedPreferences.setStringList(userPreference.name, value);
    } else if (value == null) {
      sharedPreferences.remove(userPreference.name);
    }
  }

  void reset(UserPreference userPreference) {
    sharedPreferences.remove(userPreference.name);
  }

  void resetAll() {
    for (var element in UserPreference.values) {
      reset(element);
    }
  }
}
