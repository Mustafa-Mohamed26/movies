

import 'package:movies/models/list_of_movies_response.dart';
import 'package:movies/models/movie_details_response.dart';

abstract class DetailsStates {}
class DetailsInitialState extends DetailsStates{}
class DetailsLoadingState extends DetailsStates{}
class DetailsErrorState extends DetailsStates{
  String errorMessage;
  DetailsErrorState({required this.errorMessage});
}
class DetailsSuccessState extends DetailsStates {
  final String? successMessage;
  final Movie? movie;
  final bool? isFavorite;
  final List<Movies>? moviesList;

  DetailsSuccessState({
    this.movie,
    this.moviesList,
    this.isFavorite,
    this.successMessage,
  });

  DetailsSuccessState copyWith({
    String? successMessage,
    Movie? movie,
    bool? isFavorite,
    List<Movies>? moviesList,
  }) {
    return DetailsSuccessState(
      successMessage: successMessage ?? this.successMessage,
      movie: movie ?? this.movie,
      isFavorite: isFavorite ?? this.isFavorite,
      moviesList: moviesList ?? this.moviesList,
    );
  }
}
