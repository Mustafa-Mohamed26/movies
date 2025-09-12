import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/l10n/app_localizations.dart';
import 'package:movies/utils/app_assets.dart';
import 'package:movies/utils/app_colors.dart';
import 'package:movies/utils/app_styles.dart';
import 'package:movies/widgets/custom_2column_grid_view.dart';
import 'package:movies/widgets/custom_text_form_field.dart';

import 'cubit/movie_list_states.dart';
import 'cubit/movie_list_view_model.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({super.key});

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  MovieListViewModel movieListViewModel = MovieListViewModel();
  final ScrollController _scrollController = ScrollController();

  String query = "";

  @override
  void initState() {
    super.initState();


    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200 &&
          !movieListViewModel.isLoadingMore &&
          query.isNotEmpty) {
        movieListViewModel.loadMoviesList(
          limit: 20,
          page: movieListViewModel.currentPage,
          query: query,
          isLoadMore: true,
        );
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: height * 0.02,
            left: width * 0.04,
            right: width * 0.04,
          ),
          child: CustomTextField(
            controller: movieListViewModel.searchController,
            colorBorderSide: AppColors.grey,
            style: AppStyles.regular16white,
            hintStyle: AppStyles.regular16white,
            prefixIcon: Image.asset(
              AppAssets.searchIcon,
              width: width * 0.05,
              height: height * 0.05,
            ),
            hintText: AppLocalizations.of(context)!.search,
            onChanged: (value) {
              query = value!;
              if (query.isNotEmpty) {
                movieListViewModel.loadMoviesList(
                  limit: 20,
                  page: 1,
                  query: query,
                );
              }
            },
          ),
        ),

        Expanded(
          child: BlocBuilder<MovieListViewModel, MovieListStates>(
            bloc: movieListViewModel,
            builder: (context, state) {
              if (state is MovieListErrorState) {
                return Center(
                  child: Text(
                    state.errorMessage,
                    style: AppStyles.regular20white,
                  ),
                );
              }
              if (state is MovieListEmptyState) {
                return Center(
                  child: Text(AppLocalizations.of(context)!.no_movies_found, style: AppStyles.regular20white),
                );
              }
              if (state is MovieListSuccessState) {
                return Column(
                  children: [
                    Expanded(
                      child: Custom2columnGridView(
                        controller: _scrollController,
                        count: state.moviesList.length,
                        moviesList: state.moviesList,
                      ),
                    ),
                    if (movieListViewModel.isLoadingMore)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircularProgressIndicator(color: AppColors.yellow),
                      ),
                  ],
                );
              }
              return Center(
                child: Image.asset(
                  AppAssets.emptyListIcon,
                  width: width * 0.5,
                  height: height * 0.5,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}