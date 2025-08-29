import 'package:http/http.dart' as http;
import 'package:movies/api/api_constants.dart';
import 'package:movies/api/end_points.dart';
import 'dart:convert';
import 'package:movies/models/movie_details_response.dart';
import 'package:movies/models/movie_suggestions_response.dart';
import 'package:movies/models/user_request.dart';
import 'package:movies/models/user_response.dart';
class ApiManager {
  static Future<UserResponse?> register ({required UserRequest user})async{
    Uri url = Uri.https(ApiConstants.authBaseUrl, EndPoints.registerApi, {
      "name":user.name,
      "email":user.email,
      "password": user.password,
      "confirmPassword":user.confirmPassword,
      "phone":user.phone,
      "avaterId": user.avaterId.toString()
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
}