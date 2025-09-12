import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class Token {
  // static Future<LoginResponse?> login(LoginRequest loginRequest) async {
  //   Uri url = Uri.https(ApiConstants.baseUrl, EndPoints.loginApi);
  //   try {
  //     var response = await http.post(
  //       url,
  //       body: {'email': loginRequest.email, 'password': loginRequest.password},
  //     );
  //
  //     var responseBody = response.body;
  //     var json = jsonDecode(responseBody);
  //     LoginResponse loginResponse = LoginResponse.fromJson(json);
  //     if (loginResponse.token != null) {
  //       await Token.saveToken(loginResponse.token!);
  //     }
  //     return loginResponse;
  //   } catch (e) {
  //     throw e.toString();
  //   }
  // }
  // headers: {
  // 'Authorization': 'Bearer $token',
  // });


  static Future<String?> getToken() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString("token");
    } catch (e) {
      log("Error getting token: $e");
      return null;
    }
  }

  static Future<void> saveToken(String token) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString("token", token);
    } catch (e) {
      log("Error saving token: $e");
    }
  }
}
