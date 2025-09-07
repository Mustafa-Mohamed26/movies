import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/ui/home/browse_tab/movies/Movies_Item.dart';
import 'package:movies/ui/home/home_tab/GenreList/cubit/genry_stats.dart';

import '../../../../utils/app_styles.dart';
import '../../home_tab/GenreList/cubit/genre_list_view.dart';

class MoviesBrowse extends StatefulWidget {
   MoviesBrowse({super.key,required this.genre});
  String genre;

  @override
  State<MoviesBrowse> createState() => _MoviesBrowseState();
}

class _MoviesBrowseState extends State<MoviesBrowse> {
  GenreListView viewModel =GenreListView();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getMoviesByGenre(genre: widget.genre);
    print("initState: genre = ${widget.genre}");

  }
  @override
  void didUpdateWidget(covariant MoviesBrowse oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.genre != widget.genre) {
      viewModel.getMoviesByGenre(genre: widget.genre);
      print("didUpdateWidget: genre changed to ${widget.genre}");
    }
  }


  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => viewModel,
      child: BlocBuilder<GenreListView,GenreStats>(
          builder: (context, state) {
            if(state is LoadingStats){
              return Center(child: CircularProgressIndicator(),);
            }else if(state is ErrorStats){
              return
                Center(child: Column(children: [
                  Text('error',style: AppStyles.bold20white,),
                  ElevatedButton(onPressed: (){
                    viewModel.getMoviesByGenre(genre: widget.genre);
                  }, child: Text('try again'))
                ],),);
            }else if(state is SuccessStatsByGenre){
              return Expanded(
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                    childAspectRatio: height*0.00075
                    ),
                    itemBuilder: (context, index) {
                      return
                        MoviesItem(
                          id: state.movies[index].id,
                          imagePath: state.movies[index].mediumCoverImage,
                          rating: state.movies[index].rating);
                    },
                  itemCount: state.movies.length,
                ),
              );
            }
            return Container();
          },
      ),
    );
  }
}
