
import '../../../../models/list_of_movies_response.dart';

abstract class MoviesStats{}
class LoadingStats extends MoviesStats{}
class ErrorStats extends MoviesStats{
  String errorMessage;
  ErrorStats({required this.errorMessage});
}
class SuccessStats extends MoviesStats{
 List<Movies>  movies;
  SuccessStats({required this.movies});

}
