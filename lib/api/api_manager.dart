import 'package:http/http.dart' as http;
import 'package:movies/api/api_constants.dart';
import 'package:movies/api/end_points.dart';
import 'dart:convert';
import 'package:movies/models/movie_details_response.dart';
import 'package:movies/models/movie_suggestions_response.dart';
import 'package:movies/models/reset_password_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/login_response.dart' show LoginResponse;
class ApiManager {
  static Future<MovieDetailsResponse?> getMovieDetails({
    required int? movieId,
    required bool withCast,
    required bool withImages,
  }) async {
    Uri url = Uri.https(ApiConstants.moviesBaseUrl, EndPoints.movieDetailsApi, {
      "movie_id": movieId.toString(),
      "with_cast": withCast ? "true" : "false",
      "with_images": withImages ? "true" : "false",
    });

    try {
      var response = await http.get(url);
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return MovieDetailsResponse.fromJson(json);
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<MovieSuggestionsResponse?> getMovieSuggestions({required int? movieId,}) async {
    Uri url = Uri.https(
      ApiConstants.moviesBaseUrl, EndPoints.movieSuggestionsApi,
      {"movie_id": movieId.toString()},
    );

    try {
      var response = await http.get(url);
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return MovieSuggestionsResponse.fromJson(json);
    } catch (e) {
      throw Exception(e);
    }
  }


  static Future<LoginResponse> login({required String email, required String password}) async {
    try {
      Uri url = Uri.https(ApiConstants.moviesAuthBaseUrl, EndPoints.login);

      var response = await http.post(
        url,
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        var responseBody = response.body;
        var json = jsonDecode(responseBody);
        var loginResponse = LoginResponse.fromJson(json);

        await _storeToken(loginResponse.token!);

        return loginResponse;
      } else {
        throw Exception("Login failed: ${response.statusCode} - ${response.body}");
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<void> _storeToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_token', token);


  }

  static Future<ResetPasswordResponse?> changePassword({required String newPass, required String oldPass}) async {
    try {

//timp token until take from cash
  String token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY4YjA5MjIwZmQ5MDk0NWNlODU5NTU5NCIsImVtYWlsIjoiYW5zMTIyQGdtYWlsLmNvbSIsImlhdCI6MTc1NjQwMjI1M30.Vt-zRVDlp-LP36z0_H1MKHNWNDQmmpbvPZ_RVmw-aHU";


      Uri url = Uri.https(ApiConstants.moviesAuthBaseUrl, EndPoints.resetPassword);

      var response = await http.patch(
        url,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'oldPassword': oldPass,
          'newPassword': newPass,
        }),
      );

      if (response.statusCode == 200) {
        var responseBody = response.body;
        var json = jsonDecode(responseBody);
        return ResetPasswordResponse.fromJson(json);
      } else {
        throw Exception("Failed to change password: ${response.statusCode} - ${response.body}");
      }
    } catch (e) {
      throw Exception(e);
    }
  }




}