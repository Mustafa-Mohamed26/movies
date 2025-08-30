import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:movies/api/api_constants.dart';
import 'package:movies/api/end_points.dart';
import 'package:movies/models/delete_account_response.dart';
import 'dart:convert';
import 'package:movies/models/movie_details_response.dart';

import 'package:movies/models/movie_suggestions_response.dart' hide Movies;
import 'package:movies/models/update_profile_request.dart';
import 'package:movies/models/update_profile_response.dart';
import '../models/list_of_movies_response.dart';

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




  static Future<ListOfMoviesResponse> getNewMoviesList()async{
    Uri url = Uri.https(ApiConstants.moviesBaseUrl,
    EndPoints.listMoviesApi,
      {
        "sort_by":" years"
      }

    );
    try{
      var response = await http.get(url);
      var responseBody = response.body;
      log(responseBody);
      var json = jsonDecode(responseBody);
      return ListOfMoviesResponse.fromJson(json);

    }catch(e){
      log(e.toString());
      throw e.toString();
    }

  }

  static Future<ListOfMoviesResponse> getNewMoviesListByGenre(String genre)async{
    Uri url = Uri.https(ApiConstants.moviesBaseUrl,
    EndPoints.listMoviesApi,
{
  "genre" : genre
}
    );
    try{
      var response = await http.get(url);
      var responseBody = response.body;
      log(responseBody);
      var json = jsonDecode(responseBody);
      return ListOfMoviesResponse.fromJson(json);

    }catch(e){
      log(e.toString());
      throw e.toString();
    }

  }

}

  Future<LoginResponse> login({required String email, required String password}) async {
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

   Future<void> _storeToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_token', token);


  }

   Future<ResetPasswordResponse?> changePassword({required String newPass, required String oldPass}) async {
    try {

//timp token until take from cash
  String token ="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY4YjA5MjIwZmQ5MDk0NWNlODU5NTU5NCIsImVtYWlsIjoiYW5zMTIyQGdtYWlsLmNvbSIsImlhdCI6MTc1NjQyNjA3NX0.CVwlOXUHcsx6hITiVwNgvGR2POHwP0U8EkoyX8dDGEw";
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


 Future<DeleteAccountResponse> deleteProfile() async {
  try {
    //this token for while
    String? token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY4YjA5MjIwZmQ5MDk0NWNlODU5NTU5NCIsImVtYWlsIjoiYW5zMTIyQGdtYWlsLmNvbSIsImlhdCI6MTc1NjU1NDM2M30.3IXlGeIJRBIAcYr0CdSvZ406U_LaChd4AGZYhNUp3ZI";

    Uri url = Uri.https(ApiConstants.moviesAuthBaseUrl, EndPoints.deleteAccount);

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
    }
    else {
      throw Exception(
          "Delete failed: ${response.statusCode} - ${response.body}");
    }
  } catch (e) {
    throw Exception(e.toString());
  }
}

   Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("user_token");
  }

  Future<UpdateProfileResponse> updateProfile( String email,String avatarId) async {
  try {
    //this token for while

    String? token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY4YjJlNjc0YWNlZDU5ZTAyM2FkYmY1NSIsImVtYWlsIjoiYW5zMTIyQGdtYWlsLmNvbSIsImlhdCI6MTc1NjU1NTE3NH0.PA4mOdnEnBRJuWSjaQIalU1RiaOAdaIZMWnn08HUZGs";



    Uri url = Uri.https(ApiConstants.moviesAuthBaseUrl, EndPoints.updateProfile);

    var response = await http.patch(
      url,
      headers: {
        'Authorization': 'Bearer $token',
      },
      body: {
        "email": email,
        "avaterId" : avatarId,
      });

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      return UpdateProfileResponse.fromJson(json);
    } else {
      throw Exception(
          "Update failed: ${response.statusCode} - ${response.body}");
    }
  } catch (e) {
    throw Exception(e.toString());
  }
}