import 'package:hive/hive.dart';

part 'movie_data.g.dart';

@HiveType(typeId: 1)
class MovieData extends HiveObject {
  @HiveField(0)
  String? movieId;

  @HiveField(1)
  String? name;

  @HiveField(2)
  double? rating;

  @HiveField(3)
  String? imageURL;

  @HiveField(4)
  String? year;

  MovieData({
    this.movieId,
    this.name,
    this.rating,
    this.imageURL,
    this.year,
  });

  MovieData.fromJson(Map<String, dynamic> json) {
    movieId = json['movieId']?.toString();
    name = json['name']?.toString();
    rating = (json['rating'] is num) ? (json['rating'] as num).toDouble() : null;
    imageURL = json['imageURL']?.toString();
    year = json['year']?.toString();
  }

  Map<String, dynamic> toJson() {
    return {
      'movieId': movieId,
      'name': name,
      'rating': rating,
      'imageURL': imageURL,
      'year': year,
    };
  }
}
