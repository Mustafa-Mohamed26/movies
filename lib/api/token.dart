import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class Token {
  static Future<String?> getToken() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString("user_token");
    } catch (e) {
      log("Error getting token: $e");
      return null;
    }
  }

  static Future<void> saveToken(String token) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString("user_token", token);
    } catch (e) {
      log("Error saving token: $e");
    }
  }
}
