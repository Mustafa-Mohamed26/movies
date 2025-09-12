import 'package:movies/models/list_of_movies_response.dart';

abstract class MovieListStates {}

class MovieListInitialState extends MovieListStates {}

class MovieListLoadingState extends MovieListStates {}

class MovieListEmptyState extends MovieListStates {}

class MovieListSuccessState extends MovieListStates {
  List<Movies> moviesList = [];
  MovieListSuccessState({required this.moviesList});
}

class MovieListErrorState extends MovieListStates {
  String errorMessage;
  MovieListErrorState({required this.errorMessage});
}