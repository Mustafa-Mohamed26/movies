import 'package:movies/models/movie_details_response.dart';
import 'package:movies/models/movie_suggestions_response.dart';

abstract class DetailsStates {}
class DetailsInitialState extends DetailsStates{}
class DetailsLoadingState extends DetailsStates{}
class DetailsErrorState extends DetailsStates{
  String errorMessage;
  DetailsErrorState({required this.errorMessage});
}
class DetailsSuccessState extends DetailsStates{
  Movie? movie;
  List<Movies>? moviesList = [];
  DetailsSuccessState({this.movie, this.moviesList});
}