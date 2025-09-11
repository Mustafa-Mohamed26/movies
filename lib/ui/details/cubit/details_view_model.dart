

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:movies/api/api_manager.dart';
import 'package:movies/models/list_of_movies_response.dart';
import 'package:movies/models/movie_data.dart';
import 'package:movies/models/movie_details_response.dart';
import 'package:movies/ui/details/cubit/details_states.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsViewModel extends Cubit<DetailsStates> {
  DetailsViewModel() : super(DetailsInitialState());

  void loadDetailsMovie({
    required int? movieId,
    required bool withCast,
    required bool withImages,
    required BuildContext context,
  }) async {
    emit(DetailsLoadingState());
    try {
      var response = await ApiManager.getMovieDetails(
        movieId: movieId,
        withCast: withCast,
        withImages: withImages,
      );
      if (response?.status != "ok") {
        emit(
          DetailsErrorState(errorMessage: response?.statusMessage ?? "AppLocalizations.of(context)!.error"),
        );
        return;
      }
      emit(DetailsSuccessState(movie: response?.data?.movie));
    } catch (e) {
      emit(DetailsErrorState(errorMessage: e.toString()));
    }
  }

  void loadMovieSuggestions({required int? movieId, required BuildContext context}) async {
    emit(DetailsLoadingState());
    try {
      var response = await ApiManager.getMovieSuggestions(movieId: movieId);
      if (response?.status != "ok") {
        emit(
          DetailsErrorState(errorMessage: response?.statusMessage ?? "AppLocalizations.of(context)!.error"),
        );
        return;
      }
      emit(DetailsSuccessState(moviesList: response?.data?.movies?.map((e) => e as Movies).toList() ?? []));
    } catch (e) {
      emit(DetailsErrorState(errorMessage: e.toString()));
    }
  }

  Future<void> launchURL(String url, BuildContext context) async {
    try {
      final Uri uri = Uri.parse(Uri.encodeFull(url));
      final bool launched = await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
      if (!launched) {
        debugPrint("${"AppLocalizations.of(context)!.details_view_model_not_launch"} $url");
      }
    } catch (e) {
      debugPrint("${"AppLocalizations.of(context)!.details_view_model_launch_error"} $e");
    }
  }

  void addToFavorites({required Movie movie, required BuildContext context}) async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      String? token = pref.getString('token');
      var response = await ApiManager.addFavorite(
        token: token,
        movieId: movie.id?.toString() ?? "0",
        name: movie.title ?? "",
        rating: movie.rating ?? 0.0,
        imageURL: movie.largeCoverImage ?? "",
        year: movie.year?.toString() ?? "0",
      );

      if (response?.message != "Added to favourite successfully") {
        emit(DetailsErrorState(errorMessage: response?.message ?? "AppLocalizations.of(context)!.error"));
        return;
      }
      emit(
        (state is DetailsSuccessState
                ? (state as DetailsSuccessState)
                : DetailsSuccessState())
            .copyWith(
              successMessage: response?.message ?? 'AppLocalizations.of(context)!.success',
              isFavorite: true,
            ),
      );
    } catch (e) {
      emit(DetailsErrorState(errorMessage: e.toString()));
    }
  }

  void deleteFromFavorites({required int movieId, required BuildContext context}) async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      String? token = pref.getString('token');
      var response = await ApiManager.deleteFavorite(
        token: token,
        movieId: movieId.toString(),
      );

      if (response?.message != "Removed from favourite successfully") {
        emit(DetailsErrorState(errorMessage: response?.message ?? "AppLocalizations.of(context)!.error"));
        return;
      }
      emit(
        (state is DetailsSuccessState
                ? (state as DetailsSuccessState)
                : DetailsSuccessState())
            .copyWith(
              successMessage: response?.message ?? "AppLocalizations.of(context)!.success",
              isFavorite: false,
            ),
      );
    } catch (e) {
      emit(DetailsErrorState(errorMessage: e.toString()));
    }
  }

  void isFavorite({required int movieId}) async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      String? token = pref.getString('token');
      var response = await ApiManager.isFavorite(
        token: token,
        movieId: movieId.toString(),
      );

      emit(
        (state is DetailsSuccessState
                ? (state as DetailsSuccessState)
                : DetailsSuccessState())
            .copyWith(isFavorite: response?.status ?? false),
      );
    } catch (e) {
      emit(DetailsErrorState(errorMessage: e.toString()));
    }
  }

  Future<void> saveMovie(MovieData movie) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
      String? sId = pref.getString('userId');
    // box for user
    var box = await Hive.openBox<MovieData>(sId ?? '');

    // if movie exist
    final existingKey = box.keys.firstWhere(
      (key) => box.get(key)?.movieId == movie.movieId,
      orElse: () => null,
    );

    // delete old movie
    if (existingKey != null) {
      await box.delete(existingKey);
    }

    // add new movie
    await box.add(movie);

    await box.close();
  }
}
