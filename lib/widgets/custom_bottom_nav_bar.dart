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
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 24),
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
                height: 24,
                color: currentIndex == 0 ? Colors.yellow : Colors.white,
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                AppAssets.searchIcon,
                height: 24,
                color: currentIndex == 1 ? Colors.yellow : Colors.white,
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                AppAssets.browseIcon,
                height: 24,
                color: currentIndex == 2 ? Colors.yellow : Colors.white,
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                AppAssets.profileIcon,
                height: 24,
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