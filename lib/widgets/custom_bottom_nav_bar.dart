import 'package:flutter/material.dart';
import 'package:movies/utils/app_assets.dart';
import 'package:movies/utils/app_colors.dart';


class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTabSelected;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding:  EdgeInsets.only(left: width * 0.05, right: width * 0.05, bottom: height * 0.02),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: onTabSelected,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.yellow,
          unselectedItemColor: Colors.white,
          backgroundColor: AppColors.grey,
          elevation: 0,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                AppAssets.homeIcon,
                height: height * 0.03,
                color: currentIndex == 0 ? Colors.yellow : Colors.white,
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                AppAssets.searchIcon,
                height: height * 0.03,
                color: currentIndex == 1 ? Colors.yellow : Colors.white,
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                AppAssets.browseIcon,
                height: height * 0.03,
                color: currentIndex == 2 ? Colors.yellow : Colors.white,
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                AppAssets.profileIcon,
                height: height * 0.03,
                color: currentIndex == 3 ? Colors.yellow : Colors.white,
              ),
              label: "",
            ),
          ],
        ),
      ),
    );
  }
}