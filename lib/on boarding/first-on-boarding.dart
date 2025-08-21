import 'package:flutter/material.dart';
import 'package:movies/utils/app_assets.dart';
import 'package:movies/utils/app_colors.dart';
import 'package:movies/utils/app_routes.dart';
import 'package:movies/utils/app_text_style.dart';

class FirstOnBoarding extends StatelessWidget {
  const FirstOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AppAssets.firstOnBoarding,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(
                left: width * 0.06,
                right: width * 0.06,
                bottom: height * 0.1,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Find Your Next\nFavorite Movie Here',
                    textAlign: TextAlign.center,
                    style: AppTextStyle.bold24White.copyWith(
                      decoration: TextDecoration.none,
                      fontSize: height * 0.035,
                      fontWeight: FontWeight.bold,
                      height: 1.2,
                    ),
                  ),

                  SizedBox(height: height * 0.03),

                  Text(
                    'Get access to a huge library of movies\nto suit all tastes. You will surely like it.',
                    textAlign: TextAlign.center,
                    style: AppTextStyle.normal14White.copyWith(
                      decoration: TextDecoration.none,
                    ),
                  ),

                  SizedBox(height: height * 0.02),

                  SizedBox(
                    width: width * 0.7,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(AppRoutes.onboarding2);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.yellow,
                        padding: EdgeInsets.symmetric(vertical: height * 0.02),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(width * 0.03),
                        ),
                      ),
                      child: Text(
                        'Explore Now',
                        style: AppTextStyle.bold20White,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
