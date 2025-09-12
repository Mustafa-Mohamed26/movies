import 'package:flutter/material.dart';
import 'package:movies/ui/home/browse_tab/browse_screen_tab.dart';
import 'package:movies/ui/home/home_tab/home_screen_tab.dart';
import 'package:movies/ui/home/profile_tab/profile_screen_tab.dart';
import 'package:movies/ui/home/search_tab/search_screen_tab.dart';
import 'package:movies/utils/app_styles.dart';
import 'package:movies/widgets/custom_bottom_nav_bar.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;


  void onTabSelected(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      HomeScreenTab(),
      SearchTab(),
      BrowseScreenTab(),
      ProfileTab()
    ];

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: currentIndex,
        onTabSelected: onTabSelected,
      ),
    );
  }
}