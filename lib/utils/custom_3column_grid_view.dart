import 'package:flutter/material.dart';
import 'package:movies/models/movie_data.dart';
import 'package:movies/utils/app_assets.dart';
import 'package:movies/utils/app_routes.dart';
import 'package:movies/widgets/custom_card.dart';


class Custom3columnGridView extends StatelessWidget {
  final int count;
  final List<MovieData>? movies;

  const Custom3columnGridView({
    super.key,
    required this.count,
    required this.movies,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return GridView.builder(
      padding: EdgeInsets.symmetric(vertical: height * 0.02),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: width * 0.03,
        mainAxisSpacing: height * 0.02,
        childAspectRatio: 0.7,
      ),
      itemCount: count,
      itemBuilder: (context, index) {
        final movie = movies?[index];
        return CustomCard(
          image: (movie?.imageURL?.isNotEmpty ?? false)
              ? movie?.imageURL! ?? ""
              : AppAssets.test1,
          rate: movie?.rating ?? 0.0,
          onTap: () {
            Navigator.pushNamed(
              context,
              AppRoutes.details,
              arguments: int.tryParse(movie?.movieId ?? '') ?? 0,
            );
          },
        );
      },
    );
  }
}
