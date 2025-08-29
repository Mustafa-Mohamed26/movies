import 'package:colorful_iconify_flutter/icons/circle_flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/api/api_manager.dart';
import 'package:movies/ui/home/home_tab/GenreList/genreList.dart';
import 'package:movies/ui/home/home_tab/cubit/Home_tab_view_model.dart';
import 'package:movies/ui/home/home_tab/cubit/movies_stats.dart';
import 'package:movies/utils/app_assets.dart';
import 'package:movies/utils/app_colors.dart';
import 'package:movies/utils/app_styles.dart';

import '../../../models/list_of_movies_response.dart';
import '../../../models/movie_details_response.dart';
import 'carousel_slider_New.dart';

typedef OnTab = void Function()? ;
class HomeScreenTab extends StatefulWidget {
   HomeScreenTab({super.key,required this.onTab});
   OnTab onTab;
  @override
  State<HomeScreenTab> createState() => _HomeScreenTabState();
}

class _HomeScreenTabState extends State<HomeScreenTab> {
  HomeViewModel viewModel = HomeViewModel();
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getNewMoviesList();
  }
  @override
  Widget build(BuildContext context) {
  var width = MediaQuery.of(context).size.width;
  var height = MediaQuery.of(context).size.height;
    return BlocProvider<HomeViewModel>(
      create: (context) => viewModel,
      child: SingleChildScrollView(
        child: BlocBuilder<HomeViewModel,MoviesStats>(
          builder:(context, state) {
            if(state is LoadingStats){
              return Center(child: CircularProgressIndicator(),);
            }else if(state is ErrorStats){
              return
                Center(child: Column(children: [
                  Text('error',style: AppStyles.bold20white,),
                  ElevatedButton(onPressed: viewModel.getNewMoviesList, child: Text('try again'))
                ],),)
              ;
            }else if(state is SuccessStats){
              return Column(children: [
                // Center(child: Text('${state.movies[1].year}')),
                // Image.network('${state.movies[1].mediumCoverImage}')
                Padding(
                  padding:  EdgeInsets.only(top:height*.045),
                  child: Image(image: AssetImage(AppAssets.availableNow)),
                ),
                CarouselSliderNew(movies: state.movies,),
                SizedBox(height: height*0.01,),
                Image(image: AssetImage(AppAssets.watchNow)),
                SizedBox(height: height*0.01,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Action',style: AppStyles.regular20white,),
                    TextButton(onPressed: () {}, 
                        child: Row(
                          children: [
                            Text('See More',style: AppStyles.regular16yellow,),
                            SizedBox(width: width*0.01,),
                            Icon(Icons.arrow_forward,color: AppColors.yellow,)
                          ],
                        ))
                  ],
                ),
                GenreList()
              ],);
            }
            return Container();
          },
        ),
      ),
    );
  }
}

