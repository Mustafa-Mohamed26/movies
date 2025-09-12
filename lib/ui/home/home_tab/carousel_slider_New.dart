import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies/utils/app_colors.dart';
import 'package:movies/utils/app_routes.dart';
import 'package:movies/utils/app_styles.dart';

import '../../../models/list_of_movies_response.dart';
import '../../../utils/app_assets.dart';

class CarouselSliderNew extends StatefulWidget {
   CarouselSliderNew({super.key,required this.movies});
   List<Movies> movies;

  @override
  State<CarouselSliderNew> createState() => _CarouselSliderNewState();
}

class _CarouselSliderNewState extends State<CarouselSliderNew> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage('${widget.movies[currentIndex].mediumCoverImage}'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          Image(image: AssetImage(AppAssets.availableNow)),
          SizedBox(
            width: width*0.85,
            child: CarouselSlider(
              options: CarouselOptions(
              onPageChanged: (index, reason) {
                currentIndex = index;
                setState(() {

                });
              },
              autoPlay: true,
                height: height*0.4,
              enlargeCenterPage: true,
                viewportFraction: 0.8,
              ),
              items: widget.movies.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed(AppRoutes.details,arguments:
                          i.id);
                        },
                        child: Container(
                          width: double.infinity,
                          color: Colors.white,
                          child: Stack(children: [
                            Image.network('${i.mediumCoverImage}',fit: BoxFit.fill,width: double.infinity
                              ,height: double.infinity,),
                            Container(
                              decoration: BoxDecoration(
                                color:Color(0x9f3A3737),
                                borderRadius: BorderRadius.circular(8)
                              ),
                              padding: EdgeInsets.all(width*0.01),
                              margin:EdgeInsets.all(width*0.02),
                              width: width*0.15,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text(i.rating.toString(),style: AppStyles.regular16white,),
                                  Expanded(child: Icon(Icons.star,color: AppColors.yellow,))
                                ],
                              ),
                            )

                          ],),
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          ),
          Image(image: AssetImage(AppAssets.watchNow)),

        ],
      ),
    );
  }
}
