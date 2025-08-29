import '../../../../../models/list_of_movies_response.dart';

class GenreStats{}


class LoadingStats extends GenreStats{}

class ErrorStats extends GenreStats{
  String errorMessage;
  ErrorStats({required this.errorMessage});
}

class SuccessStatsByGenre extends GenreStats{
  List<Movies>  movies;
  SuccessStatsByGenre({required this.movies});

}
