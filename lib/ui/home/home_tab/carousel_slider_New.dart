import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies/utils/app_colors.dart';
import 'package:movies/utils/app_styles.dart';

import '../../../models/list_of_movies_response.dart';

class CarouselSliderNew extends StatelessWidget {
   CarouselSliderNew({super.key,required this.movies});
   List<Movies> movies;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return CarouselSlider(
      options: CarouselOptions(autoPlay: true,
      aspectRatio: 4/3,
      enlargeCenterPage: true,
        viewportFraction: 0.8,
      ),
      items: movies.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(20),
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
                        Icon(Icons.star,color: AppColors.yellow,)
                      ],
                    ),
                  )

                ],),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
