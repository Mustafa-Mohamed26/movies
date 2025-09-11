import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/models/movie_data.dart';
import 'package:movies/models/movie_details_response.dart';
import 'package:movies/ui/details/cubit/details_states.dart';
import 'package:movies/ui/details/cubit/details_view_model.dart';
import 'package:movies/ui/home/profile_tab/profile_tab_bloc/profile_view_model.dart';
import 'package:movies/utils/app_assets.dart';
import 'package:movies/utils/app_colors.dart';
import 'package:movies/utils/app_constants.dart';
import 'package:movies/utils/app_routes.dart';
import 'package:movies/utils/app_styles.dart';
import 'package:movies/widgets/custom_button.dart';
import 'package:movies/widgets/custom_card.dart';
import 'package:movies/widgets/custom_rank.dart';
import 'package:movies/widgets/custom_screen_shot.dart';

import '../../l10n/app_localizations.dart';

class DetailsScreen extends StatefulWidget {
  final int movieId;
  const DetailsScreen({super.key, required this.movieId});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  DetailsViewModel detailsViewModel = DetailsViewModel();
  DetailsViewModel suggestionsViewModel = DetailsViewModel();
  late ProfileViewModel profileViewModel;

  @override
  void initState() {
    super.initState();
    int movieId = widget.movieId;
    detailsViewModel.isFavorite(movieId: movieId);
    detailsViewModel.loadDetailsMovie(
      context: context,
      movieId: movieId,
      withCast: true,
      withImages: true,
    );

    suggestionsViewModel.loadMovieSuggestions(
      movieId: movieId,
      context: context,
    );
    profileViewModel = context.read<ProfileViewModel>();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocBuilder<DetailsViewModel, DetailsStates>(
          bloc: detailsViewModel,
          builder: (context, state) {
            // loading state
            if (state is DetailsErrorState) {
              return Center(
                child: Text(
                  state.errorMessage,
                  style: AppStyles.regular20white,
                ),
              );
            }

            // success state
            if (state is DetailsSuccessState) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // title section
                  Container(
                    height: height * 0.7,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image:
                            (state.movie?.largeCoverImage?.isNotEmpty ?? false)
                            ? CachedNetworkImageProvider(
                                state.movie!.largeCoverImage!,
                              )
                            : AssetImage(AppAssets.test3) as ImageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            AppColors.transparent,
                            AppColors.transparent,
                            AppColors.black,
                          ],
                        ),
                      ),
                      child: SafeArea(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // back button
                                IconButton(
                                  onPressed: () {
                                    profileViewModel.getAllFavorites(
                                      context: context,
                                    );
                                    profileViewModel.loadHistory();
                                    Navigator.pop(context);
                                  },
                                  icon: const Icon(
                                    Icons.arrow_back_ios,
                                    color: Colors.white,
                                  ),
                                ),

                                // favorite button
                                IconButton(
                                  onPressed: () {
                                    if (state.isFavorite ?? false) {
                                      detailsViewModel.deleteFromFavorites(
                                        movieId: widget.movieId,
                                        context: context,
                                      );
                                    } else {
                                      detailsViewModel.addToFavorites(
                                        context: context,
                                        movie: Movie(
                                          id: widget.movieId,
                                          title: state.movie!.title,
                                          rating: state.movie!.rating,
                                          largeCoverImage:
                                              state.movie!.largeCoverImage,
                                          year: state.movie!.year,
                                        ),
                                      );
                                    }
                                  },
                                  icon: Icon(
                                    Icons.favorite,
                                    color: state.isFavorite ?? false
                                        ? Colors.yellow
                                        : Colors.white,
                                    size: 35,
                                  ),
                                ),
                              ],
                            ),

                            // play button
                            IconButton(
                              onPressed: () async {
                                if (state.movie?.url != null) {
                                  detailsViewModel.launchURL(
                                    state.movie!.url!,
                                    context,
                                  );
                                }

                                final movieToSave = MovieData(
                                  movieId: state.movie!.id.toString(),
                                  name: state.movie!.title,
                                  rating: state.movie!.rating,
                                  imageURL: state.movie!.largeCoverImage,
                                  year:
                                      state.movie!.year?.toString() ??
                                      AppLocalizations.of(context,)!.details_unKnown,
                                );

                                await detailsViewModel.saveMovie(movieToSave);
                              },
                              icon: Image.asset(AppAssets.playIcon),
                            ),

                            // title and year
                            Column(
                              children: [
                                Text(
                                  "${state.movie?.title}\n${state.movie?.year}",
                                  style: AppStyles.bold20white,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsetsGeometry.symmetric(
                      horizontal: width * 0.04,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // button and rank section
                        CustomButton(
                          onPressed: () async {
                            if (state.movie?.url != null) {
                              detailsViewModel.launchURL(
                                state.movie!.url!,
                                context,
                              );
                            }

                            final movieToSave = MovieData(
                              movieId: state.movie!.id.toString(),
                              name: state.movie!.title,
                              rating: state.movie!.rating,
                              imageURL: state.movie!.largeCoverImage,
                              year:
                                  state.movie!.year?.toString() ??
                                  AppLocalizations.of(context)!.details_unKnown,
                            );

                            await detailsViewModel.saveMovie(movieToSave);
                          },
                          text:
                              AppLocalizations.of(context,)!.details_screen_watch,
                          textStyle: AppStyles.bold20white,
                          backgroundColor: AppColors.red,
                          borderColorSide: AppColors.red,
                        ),
                        SizedBox(height: height * 0.02),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomRank(
                              icon: AppAssets.heartIcon,
                              rank: state.movie?.likeCount.toString() ?? "0",
                            ),
                            CustomRank(
                              icon: AppAssets.clockIcon,
                              rank: "${state.movie?.runtime}",
                            ),
                            CustomRank(
                              icon: AppAssets.starIcon,
                              rank: "${state.movie?.rating}",
                            ),
                          ],
                        ),
                        // screen short section
                        SizedBox(height: height * 0.02),
                        Text(
                          AppLocalizations.of(context)!.details_screen_shots,
                          style: AppStyles.bold20white,
                        ),
                        SizedBox(height: height * 0.01),
                        CustomScreenShot(
                          image: state.movie?.largeScreenshotImage1 ?? "",
                        ),
                        SizedBox(height: height * 0.01),
                        CustomScreenShot(
                          image: state.movie?.largeScreenshotImage2 ?? "",
                        ),
                        SizedBox(height: height * 0.01),
                        CustomScreenShot(
                          image: state.movie?.largeScreenshotImage3 ?? "",
                        ),

                        // similar section
                        SizedBox(height: height * 0.02),
                        Text(
                          AppLocalizations.of(context)!.details_screen_Similar,
                          style: AppStyles.bold20white,
                        ),
                        SizedBox(height: height * 0.01),

                        BlocBuilder<DetailsViewModel, DetailsStates>(
                          bloc: suggestionsViewModel,
                          builder: (context, state) {
                            if (state is DetailsErrorState) {
                              return Center(
                                child: Text(
                                  state.errorMessage,
                                  style: AppStyles.regular20white,
                                ),
                              );
                            }
                            if (state is DetailsSuccessState) {
                              return GridView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 15,
                                      crossAxisSpacing: 15,
                                      childAspectRatio: 3 / 4,
                                    ),
                                itemCount: state.moviesList?.length ?? 0,
                                itemBuilder: (context, index) {
                                  final movie = state.moviesList![index];

                                  return CustomCard(
                                    image:
                                        (movie.mediumCoverImage?.isNotEmpty ??
                                            false)
                                        ? movie.mediumCoverImage!
                                        : AppAssets.test1,
                                    rate: movie.rating ?? 0.0,
                                    onTap: () {
                                      Navigator.pushReplacementNamed(
                                        context,
                                        AppRoutes.details,
                                        arguments: movie.id,
                                      );
                                    },
                                  );
                                },
                              );
                            }
                            return SizedBox(
                              height: height * 0.25,
                              child: Center(
                                child: CircularProgressIndicator(
                                  color: AppColors.yellow,
                                ),
                              ),
                            );
                          },
                        ),

                        // summary section
                        SizedBox(height: height * 0.02),
                        Text(
                          AppLocalizations.of(context)!.details_screen_summary,
                          style: AppStyles.bold20white,
                        ),
                        SizedBox(height: height * 0.01),
                        Text(
                          state.movie?.descriptionIntro ??
                              AppLocalizations.of(context,)!.details_screen_no_description,
                          style: AppStyles.regular16white,
                        ),

                        // cast section
                        SizedBox(height: height * 0.02),
                        Text(
                          AppLocalizations.of(context)!.details_screen_cast,
                          style: AppStyles.bold20white,
                        ),
                        SizedBox(height: height * 0.01),
                        ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: state.movie?.cast?.length ?? 0,
                          itemBuilder: (context, index) {
                            final cast = state.movie!.cast![index];
                            return Card(
                              margin: EdgeInsets.only(bottom: height * 0.01),
                              color: AppColors.grey,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: ListTile(
                                leading: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child:
                                      (cast.urlSmallImage?.isNotEmpty ?? false)
                                      ? Image.network(
                                          cast.urlSmallImage!,
                                          fit: BoxFit.cover,
                                          width: 50,
                                          height: 50,
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                                return Image.asset(
                                                  AppAssets.test1,
                                                  fit: BoxFit.cover,
                                                  width: 50,
                                                  height: 50,
                                                );
                                              },
                                        )
                                      : Image.asset(
                                          AppAssets.test5,
                                          fit: BoxFit.cover,
                                          width: 50,
                                          height: 50,
                                        ),
                                ),
                                title: Text(
                                  cast.name ?? "",
                                  style: AppStyles.regular20white,
                                ),
                                subtitle: Text(
                                  cast.characterName ?? "",
                                  style: AppStyles.regular16white,
                                ),
                                onTap: () {},
                              ),
                            );
                          },
                        ),

                        // Genres section
                        SizedBox(height: height * 0.02),
                        Text(
                          AppLocalizations.of(context)!.details_screen_genres,
                          style: AppStyles.bold20white,
                        ),
                        SizedBox(height: height * 0.01),
                        GridView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                mainAxisSpacing: 1,
                                crossAxisSpacing: 15,
                                childAspectRatio: 2 / 1,
                              ),
                          itemCount: state.movie?.genres?.length ?? 0,
                          itemBuilder: (context, index) {
                            return Center(
                              child: CustomRank(
                                rank: state.movie?.genres?[index] ?? "",
                                textStyle: AppStyles.regular12white,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: height * 0.06),
                ],
              );
            }
            return SizedBox(
              height: height,
              child: Center(
                child: CircularProgressIndicator(color: AppColors.yellow),
              ),
            );
          },
        ),
      ),
    );
  }
}
