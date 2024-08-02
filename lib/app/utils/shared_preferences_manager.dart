import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {
  static Future<void> writePrefs(Map<String, dynamic> map) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    for (String key in map.keys) {
      final dynamic value = map[key];
      if (value is String) {
        await prefs.setString(key, value);
      } else if (value is int) {
        await prefs.setInt(key, value);
      } else if (value is double) {
        await prefs.setDouble(key, value);
      } else if (value is bool) {
        await prefs.setBool(key, value);
      } else if (value == null) {
        await prefs.remove(key);
      } else {
        throw Exception('Unsupported value type: ${value.runtimeType}');
      }
    }
  }

  static Future<bool> writePref<T>(String key, dynamic value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isSuccess;
    if (T == bool) {
      isSuccess = await prefs.setBool(key, value);
    } else {
      isSuccess = await prefs.setString(key, value);
    }
    return isSuccess;
  }

  static Future<Map<String, dynamic>> readPrefs() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final Set keys = prefs.getKeys();
    final Map<String, dynamic> result = {};
    for (var key in keys) {
      result.addAll({key: (await readPref(key))});
    }
    return result;
  }

  static Future<T?> readPref<T>(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final T? result = prefs.get(key) as T?;
    return result;
  }
}
