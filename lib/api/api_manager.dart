import 'package:http/http.dart' as http;
import 'package:movies/api/api_constants.dart';
import 'package:movies/api/end_points.dart';
import 'dart:convert';
import 'package:movies/models/movie_details_response.dart';
import 'package:movies/models/movie_suggestions_response.dart';
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
      ApiConstants.moviesBaseUrl, EndPoints.movieSuggestionsApi, {"movie_id": movieId.toString()},
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

  Future<void> changePassword({required String currentPassword, required String newPassword,}) async {
    Uri url= Uri.https(ApiConstants.moviesBaseUrl ,EndPoints.movieDetailsApi
     ,{
      "" : currentPassword,
      "" : newPassword
        }
    );
    try{
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['success'] != true) {
        throw Exception(data['message'] ?? 'failed to change password');
      }
    } else {
      throw Exception('Wrong in Service: ${response.statusCode}');
    }
  }catch(e){
      throw Exception(e);
    }

  }

}