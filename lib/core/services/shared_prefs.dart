import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  // Private constructor
  SharedPrefs._();

  // SharedPreferences object
  static late SharedPreferences _preferences;

  // Initialize SharedPreferences instance only once
  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  // Factory constructor to return the singleton instance
  // factory SharedPrefs() {
  //   return _instance;
  // }

  // -------------------- Setters --------------------

  // Set String value
  static void setString(String key, String value) {
    _preferences.setString(key, value);
  }

  // Set int value
  static void setInt(String key, int value) {
    _preferences.setInt(key, value);
  }

  // Set bool value
  static void setBool(String key, bool value) {
    _preferences.setBool(key, value);
  }

  // Set double value
  static void setDouble(String key, double value) {
    _preferences.setDouble(key, value);
  }

  // Set List<String> value
  static void setStringList(String key, List<String> value) {
    _preferences.setStringList(key, value);
  }

  // -------------------- Getters --------------------

  // Get String value
  static String getString(String key) {
    return _preferences.getString(key) ?? '';
  }

  // Get int value
  static int? getInt(String key) {
    return _preferences.getInt(key);
  }

  // Get bool value
  static bool getBool(String key) {
    return _preferences.getBool(key) ?? false;
  }

  // Get double value
  static double? getDouble(String key) {
    return _preferences.getDouble(key);
  }

  // Get List<String> value
  static List<String> getStringList(String key) {
    return _preferences.getStringList(key) ?? [];
  }

  // -------------------- Remove and Clear --------------------

  // Remove value
  static void remove(String key) {
    _preferences.remove(key);
  }

  // Clear all values
  static void clear() {
    _preferences.clear();
  }
}
