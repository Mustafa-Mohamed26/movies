import 'package:flutter/material.dart';
import 'package:movies/models/list_of_movies_response.dart';
import 'package:movies/utils/app_assets.dart';
import 'package:movies/utils/app_routes.dart';
import 'package:movies/widgets/custom_card.dart';

class Custom2columnGridView extends StatelessWidget {
  final int count;
  final List<Movies> moviesList;
  final ScrollController? controller;

  const Custom2columnGridView({
    super.key,
    required this.count,
    required this.moviesList,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return GridView.builder(
      controller: controller,
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.05,
        vertical: height * 0.02,
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: width * 0.05,
        mainAxisSpacing: height * 0.02,
        childAspectRatio: 0.7,
      ),
      itemCount: count,
      itemBuilder: (context, index) {
        final movie = moviesList[index];
        return CustomCard(
          image: (movie.mediumCoverImage?.isNotEmpty ?? false)
              ? movie.mediumCoverImage!
              : AppAssets.test1,
          rate: movie.rating ?? 0.0,
          onTap: () {
            Navigator.pushNamed(
              context,
              AppRoutes.details,
              arguments: movie.id,
            );
          },
        );
      },
    );
  }
}