import 'package:flutter/material.dart';
import 'package:movies/utils/app_styles.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_routes.dart';

class MoviesItem extends StatelessWidget {
   MoviesItem({super.key,
   required this.id,
     required this.imagePath,
     required this.rating
   });
   int? id;
   String? imagePath;
   double? rating;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.all(height*0.01),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(AppRoutes.details,
                //todo state.movies[index].id
                arguments: id);
          },
          child: Container(
            color: Colors.transparent,
            child: Stack(children: [
              //todo state.movies[index].mediumCoverImage
              Image.network(imagePath??'',
                height: double.infinity,fit: BoxFit.cover,width: double.infinity,),
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
                    //todo state.movies[index].rating
                    Text(rating.toString(),style: AppStyles.regular16white,),
                    Expanded(child: Icon(Icons.star,color: AppColors.yellow,))
                  ],
                ),
              )

            ],),
          ),
        ),
      ),
    );
  }
}
