import 'package:movies/models/movie_data.dart';

class FavoriteResponse {
  String? message;
  bool? status; // for is-favorite
  MovieData? movie; // for add/get one
  List<MovieData>? movies; // for get all

  FavoriteResponse({this.message, this.status, this.movie, this.movies});

  FavoriteResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];

    if (json['data'] is bool) {
      status = json['data'];
    } else if (json['data'] is Map<String, dynamic>) {
      movie = MovieData.fromJson(json['data']);
    } else if (json['data'] is List) {
      movies = (json['data'] as List)
          .map((item) => MovieData.fromJson(item))
          .toList();
    }
  }
}


