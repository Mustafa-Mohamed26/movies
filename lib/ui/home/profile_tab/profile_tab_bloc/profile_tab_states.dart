import 'package:movies/models/movie_data.dart';
import 'package:movies/models/user_response.dart';

abstract class ProfileStates {}

class ProfileInitialState extends ProfileStates {}

class ProfileLoadingState extends ProfileStates {}

class ProfileErrorState extends ProfileStates {
  final String errorMessage;
  ProfileErrorState(this.errorMessage);
}

class ProfileSuccessState extends ProfileStates {
  final User? user;
  final List<MovieData>? movies;
  final List<MovieData>? historyMovies; // History
  final String? successMessage;

  ProfileSuccessState({
    this.successMessage,
    this.user,
    this.movies,
    this.historyMovies,
  });

  ProfileSuccessState copyWith({
    User? user,
    List<MovieData>? movies,
    List<MovieData>? historyMovies,
    String? successMessage,
  }) {
    return ProfileSuccessState(
      user: user ?? this.user,
      movies: movies ?? this.movies,
      successMessage: successMessage ?? this.successMessage,
      historyMovies: historyMovies ?? this.historyMovies,
    );
  }
}