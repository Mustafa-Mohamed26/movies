import 'package:flutter/material.dart';
import 'package:movies/utils/app_assets.dart';
import 'package:movies/utils/app_colors.dart';
import 'package:movies/utils/app_text_style.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int selectIndex = 0;
  final PageController _pageController = PageController();

  List<String> backGround = [
    AppAssets.onBoarding1,
    AppAssets.onBoarding2,
    AppAssets.onBoarding3,
    AppAssets.onBoarding4,
    AppAssets.onBoarding5,
  ];

  List<String> title = [
    'Discover Movies',
    'Explore All Genres',
    'Create Watchlists',
    'Rate, Review, and Learn',
    'Start Watching Now',
  ];

  List<String> description = [
    'Explore a vast collection of movies in all qualities and genres. Find your next favorite film with ease.',
    'Discover movies from every genre, in all available qualities. Find something new and exciting to watch every day.',
    'Save movies to your watchlist to keep track of what you want to watch next. Enjoy films in various qualities and genres.',
    'Share your thoughts on the movies you\'ve watched. Dive deep into film details and help others discover great movies with your reviews.',
    'Ready to dive into the world of cinema? Start your movie journey now with our extensive collection.',
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          // PageView for background images
          PageView.builder(
            controller: _pageController,
            itemCount: backGround.length,
            onPageChanged: (index) {
              setState(() {
                selectIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return Image.asset(
                backGround[index],
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              );
            },
          ),

          // Back button at top left

          // Content at the bottom
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.05,
                  vertical: height * 0.02,
                ),
                decoration: BoxDecoration(
                  color: AppColors.black,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(height: height * 0.03),

                    Text(
                      title[selectIndex],
                      style: AppTextStyle.bold16White,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: height * 0.02),

                    Text(
                      description[selectIndex],
                      style: AppTextStyle.normal14White,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: height * 0.03),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (selectIndex < backGround.length - 1) {
                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                            );
                          } else {
                            //todo: to navigate home screen
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.yellow,
                          padding: EdgeInsets.symmetric(
                            vertical: height * 0.02,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(width * 0.03),
                          ),
                        ),
                        child: Text(
                          selectIndex < backGround.length - 1
                              ? 'Next'
                              : 'Get Started',
                          style: AppTextStyle.bold20White,
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.03),
                    if (selectIndex > 0)
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            _pageController.previousPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.transparent,
                            padding: EdgeInsets.symmetric(
                              vertical: height * 0.02,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(width * 0.03),
                              side: BorderSide(
                                color: AppColors.yellow,
                                width: 2,
                              ),
                            ),
                          ),
                          child: Text(
                            'Back',
                            style: AppTextStyle.bold20White.copyWith(
                              color: AppColors.yellow,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
