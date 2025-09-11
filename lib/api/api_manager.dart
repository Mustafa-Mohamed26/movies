import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:movies/api/api_constants.dart';
import 'package:movies/api/end_points.dart';
import 'package:movies/models/favorite_response.dart';
import 'package:movies/models/login_request.dart';
import 'package:movies/models/login_response.dart';
import 'package:movies/models/delete_account_response.dart';
import 'dart:convert';
import 'package:movies/models/movie_details_response.dart';
import 'package:movies/models/movie_suggestions_response.dart' hide Movies;
import 'package:movies/models/update_profile_request.dart';
import 'package:movies/models/update_profile_response.dart';
import '../models/list_of_movies_response.dart';
import 'package:movies/models/movie_suggestions_response.dart';
import 'package:movies/models/user_request.dart';
import 'package:movies/models/user_response.dart';
import 'package:movies/models/reset_password_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/login_response.dart' show LoginResponse;

class ApiManager {
  static Future<UserResponse?> register({required UserRequest user}) async {
    Uri url = Uri.https(ApiConstants.authBaseUrl, EndPoints.registerApi, {
      "name": user.name,
      "email": user.email,
      "password": user.password,
      "confirmPassword": user.confirmPassword,
      "phone": user.phone,
      "avaterId": user.avaterId.toString(),
    });
    try {
      var response = await http.post(url);
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return UserResponse.fromJson(json);
    } catch (e) {
      throw Exception(e);
    }
  }

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

  static Future<MovieSuggestionsResponse?> getMovieSuggestions({
    required int? movieId,
  }) async {
    Uri url = Uri.https(
      ApiConstants.moviesBaseUrl,
      EndPoints.movieSuggestionsApi,
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

  static Future<LoginResponse?> login(LoginRequest loginRequest) async {
    Uri url = Uri.https(ApiConstants.baseUrl, EndPoints.loginApi);
    try {
      var response = await http.post(
        url,
        body: {'email': loginRequest.email, 'password': loginRequest.password},
      );
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return LoginResponse.fromJson(json);
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<ListOfMoviesResponse> getNewMoviesList() async {
    Uri url = Uri.https(ApiConstants.moviesBaseUrl, EndPoints.listMoviesApi, {
      "sort_by": " years",
    });
    try {
      var response = await http.get(url);
      var responseBody = response.body;
      log(responseBody);
      var json = jsonDecode(responseBody);
      return ListOfMoviesResponse.fromJson(json);
    } catch (e) {
      log(e.toString());
      throw e.toString();
    }
  }

  static Future<ListOfMoviesResponse> getNewMoviesListByGenre(
    String genre,
  ) async {
    Uri url = Uri.https(ApiConstants.moviesBaseUrl, EndPoints.listMoviesApi, {
      "genre": genre,
    });
    try {
      var response = await http.get(url);
      var responseBody = response.body;
      log(responseBody);
      var json = jsonDecode(responseBody);
      return ListOfMoviesResponse.fromJson(json);
    } catch (e) {
      log(e.toString());
      throw e.toString();
    }
  }

  Future<void> _storeToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_token', token);
  }

  Future<ResetPasswordResponse?> changePassword({
    required String newPass,
    required String oldPass,
  }) async {
    try {
      //timp token until take from cash
      String token =
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY4YjA5MjIwZmQ5MDk0NWNlODU5NTU5NCIsImVtYWlsIjoiYW5zMTIyQGdtYWlsLmNvbSIsImlhdCI6MTc1NjQyNjA3NX0.CVwlOXUHcsx6hITiVwNgvGR2POHwP0U8EkoyX8dDGEw";
      Uri url = Uri.https(
        ApiConstants.moviesAuthBaseUrl,
        EndPoints.resetPassword,
      );

      var response = await http.patch(
        url,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({'oldPassword': oldPass, 'newPassword': newPass}),
      );

      if (response.statusCode == 200) {
        var responseBody = response.body;
        var json = jsonDecode(responseBody);
        return ResetPasswordResponse.fromJson(json);
      } else {
        throw Exception(
          "Failed to change password: ${response.statusCode} - ${response.body}",
        );
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<DeleteAccountResponse> deleteProfile() async {
    try {
      String? token = await getToken();

      if (token == null) {
        throw Exception("User token not found!");
      }

      Uri url = Uri.https(
        ApiConstants.moviesAuthBaseUrl,
        EndPoints.deleteAccount,
      );

      var response = await http.delete(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        var responseBody = response.body;
        var json = jsonDecode(responseBody);
        return DeleteAccountResponse.fromJson(json);
      } else {
        throw Exception(
          "Delete failed: ${response.statusCode} - ${response.body}",
        );
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<FavoriteResponse?> getAllFavorites({
    required String? token,
  }) async {
    Uri url = Uri.https(ApiConstants.baseUrl, EndPoints.allFavoritesApi);
    try {
      var response = await http.get(
        url,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );
      var json = jsonDecode(response.body);
      return FavoriteResponse.fromJson(json);
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<UserResponse?> getProfile({required String token}) async {
    Uri url = Uri.https(ApiConstants.baseUrl, EndPoints.profileApi);
    try {
      var response = await http.get(
        url,
        headers: {
          "Content-Type": "application/json", // to be able to send json
          "Authorization": "Bearer $token", // to be able to send the token
        },
      );
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return UserResponse.fromJson(json);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("user_token");
  }

  Future<UpdateProfileResponse> updateProfile(
    UpdateProfileRequest request,
  ) async {
    try {
      String? token = await getToken();

      if (token == null) {
        throw Exception("User token not found!");
      }

      Uri url = Uri.https(
        ApiConstants.moviesAuthBaseUrl,
        EndPoints.updateProfile,
      );

      var response = await http.put(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(request.toJson()),
      );

      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        return UpdateProfileResponse.fromJson(json);
      } else {
        throw Exception(
          "Update failed: ${response.statusCode} - ${response.body}",
        );
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
