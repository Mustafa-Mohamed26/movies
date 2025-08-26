import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/api/api_manager.dart';
import 'package:movies/ui/details/cubit/details_states.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsViewModel extends Cubit<DetailsStates> {
  DetailsViewModel() : super(DetailsInitialState());

  void loadDetailsMovie({
    required int? movieId,
    required bool withCast,
    required bool withImages,
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
          DetailsErrorState(errorMessage: response?.statusMessage ?? "Error"),
        );
        return;
      }
      emit(DetailsSuccessState(movie: response?.data?.movie));
    } catch (e) {
      emit(DetailsErrorState(errorMessage: e.toString()));
    }
  }

  void loadMovieSuggestions({required int? movieId}) async {
    emit(DetailsLoadingState());
    try {
      var response = await ApiManager.getMovieSuggestions(movieId: movieId);
      if (response?.status != "ok") {
        emit(
          DetailsErrorState(errorMessage: response?.statusMessage ?? "Error"),
        );
        return;
      }
      emit(DetailsSuccessState(moviesList: response?.data?.movies ?? []));
    } catch (e) {
      emit(DetailsErrorState(errorMessage: e.toString()));
    }
  }

  Future<void> launchURL(String url) async {
    try {
      final Uri uri = Uri.parse(Uri.encodeFull(url));
      final bool launched = await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
      if (!launched) {
        debugPrint("Could not launch $url");
      }
    } catch (e) {
      debugPrint("Launch error: $e");
    }
  }
}
