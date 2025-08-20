import 'package:flutter/material.dart';
import 'package:movies/utils/app_styles.dart';
import 'package:movies/widgets/custom_bottom_nav_bar.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  final List<Widget> pages = [
    Center(child: Text("Page 0", style: AppStyles.medium36white,)),
    Center(child: Text("Page 1", style: AppStyles.medium36white,)),
    Center(child: Text("Page 2", style: AppStyles.medium36white,)),
    Center(child: Text("Page 3", style: AppStyles.medium36white,)),
  ];

  void onTabSelected(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: currentIndex,
        onTabSelected: onTabSelected,
      ),
    );
  }
}