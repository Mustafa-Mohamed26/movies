import 'package:flutter/material.dart';
import 'package:movies/ui/home/browse_tab/movies/movies_browes.dart';

import '../../../utils/app_colors.dart';
import 'genre_Tab_Icon.dart';

class BrowseScreenTab extends StatefulWidget {
   BrowseScreenTab({super.key});


  @override
  State<BrowseScreenTab> createState() => _BrowseScreenTabState();
}

class _BrowseScreenTabState extends State<BrowseScreenTab> {
  List<String> genres = [
  "Action",
  "Adventure",
  "Animation",
  "Biography",
  "Comedy",
  "Crime",
  "Documentary",
  "Drama",
  "Family",
  "Fantasy",
  "Film-Noir",
  "History",
  "Horror",
  "Music",
  "Musical",
  "Mystery",
  "Romance",
  "Sci-Fi",
  "Sport",
  "Thriller",
  "War",
  "Western"
  ]

  ;
  int selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: DefaultTabController(
            length: genres.length,
            child: TabBar(
                onTap: (index) {
                  selectedIndex=index;
                  setState(() {

                  });
                },
                isScrollable: true,
                dividerColor: Colors.transparent,
                indicatorColor: Colors.transparent,
                tabAlignment: TabAlignment.start,
                labelPadding: EdgeInsets.zero,
                tabs: genres.map((e) {
                  return GenreTapIcon(
                      borderColor: AppColors.yellow,
                      colorUnSlectText: AppColors.yellow,
                      colorSlectText: AppColors.black,
                      colorSlect: AppColors.yellow,
                      isSlected: selectedIndex==genres.indexOf(e),
                      eventName: e);
                },).toList()
            )
        ),
      ),
      body: Column(
        children: [
          MoviesBrowse(genre: genres[selectedIndex])
        ],
      ),
    );
  }
}
