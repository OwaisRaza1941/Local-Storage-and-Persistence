import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageKeys {
  static final String loginKey = 'isLoggined';
  static final String themeValue = 'themeValue';
  static final String isONBoarding = 'isONBoarding';
  static final String userValueKey = 'userValue';
}

class LocalStorage {
  static late SharedPreferences _preferences;

  /// Initialize SharedPrefence
  static Future<void> initialize() async {
    _preferences = await SharedPreferences.getInstance();
  }

  /// set a String value
  static Future<void> setString(String key, String value) async {
    await _preferences.setString(key, value);
  }

  /// get a String value
  static String? getString(String key) {
    return _preferences.getString(key);
  }

  /// set a int value
  Future<void> setInt(String key, int value) async {
    await _preferences.setInt(key, value);
  }

  /// get a int value
  static int? getInt(String key) {
    return _preferences.getInt(key);
  }

  /// set a double value
  static Future<void> setDouble(String key, double value) async {
    await _preferences.setDouble(key, value);
  }

  /// get a double value
  static double? getDouble(String key) {
    return _preferences.getDouble(key);
  }

  /// set a bool value
  static Future<void> setBool(String key, bool value) async {
    await _preferences.setBool(key, value);
  }

  /// get a bool value
  static bool? getBool(String key) {
    return _preferences.getBool(key);
  }

  /// set a List<Map> values
  static Future<void> setListMap(
    String key,
    List<Map<String, dynamic>> value,
  ) async {
    final jsonValue = jsonEncode(value);
    await _preferences.setString(key, jsonValue);
  }

  // Get a List<Map<String, dynamic>> value
  static List<Map<String, dynamic>>? getListMap(String key) {
    final jsonString = _preferences.getString(key);
    if (jsonString != null) {
      final List<dynamic> jsonList = jsonDecode(jsonString);
      return jsonList.cast<Map<String, dynamic>>();
    }
    return null;
  }

  /// set a JSON value
  static Future<void> setMap(String key, Map<String, dynamic> value) async {
    final jsonString = jsonEncode(value);
    await _preferences.setString(key, jsonString);
  }

  /// get a JSON value
  static Map<String, dynamic>? getMap(String key) {
    final jsonList = _preferences.getString(key);
    if (jsonList != null) {
      return jsonDecode(jsonList);
    }
    return null;
  }

  /// Clear the Local Storage
  static Future<void> clear() async {
    await _preferences.clear();
  }

  /// Remove a value By key
  static Future<void> remove(String key) async {
    await _preferences.remove(key);
  }

  //// Check if a key exists
  static bool containsKey(String key) {
    return _preferences.containsKey(key);
  }
}
