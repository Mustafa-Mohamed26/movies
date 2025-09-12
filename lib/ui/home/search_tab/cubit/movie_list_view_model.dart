import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/api/api_manager.dart';
import 'package:movies/models/list_of_movies_response.dart';

import 'movie_list_states.dart';

class MovieListViewModel extends Cubit<MovieListStates> {
  MovieListViewModel() : super(MovieListInitialState());

  TextEditingController searchController = TextEditingController();

  int currentPage = 1;
  bool isLoadingMore = false;
  List<Movies> allMovies = [];

  void loadMoviesList({
    String? genre,
    int? limit,
    int? page,
    String? query,
    bool isLoadMore = false,
  }) async {
    try {
      if (isLoadMore) {
        isLoadingMore = true;
      } else {
        emit(MovieListLoadingState());
        allMovies.clear();
        currentPage = 1;
      }

      var response = await ApiManager.getListOfMovies(
        genre: genre,
        limit: limit,
        page: page,
        query: searchController.text,
      );

      if (response?.status != "ok") {
        emit(MovieListErrorState(
            errorMessage: response?.statusMessage ?? "Error"));
        isLoadingMore = false;
        return;
      }

      var newMovies = response!.data!.movies ?? [];

      if (newMovies.isEmpty && !isLoadMore) {
        emit(MovieListEmptyState());
        isLoadingMore = false;
        return;
      }

      allMovies.addAll(newMovies);

      emit(MovieListSuccessState(moviesList: List.from(allMovies)));

      if (isLoadMore) {
        currentPage++;
      }

      isLoadingMore = false;
    } catch (e) {
      emit(MovieListErrorState(errorMessage: e.toString()));
      isLoadingMore = false;
    }
  }
}