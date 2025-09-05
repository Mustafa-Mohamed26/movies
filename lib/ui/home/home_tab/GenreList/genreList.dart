import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/ui/home/home_tab/GenreList/cubit/genre_list_view.dart';
import 'package:movies/ui/home/home_tab/GenreList/cubit/genry_stats.dart';
import 'package:movies/utils/app_routes.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_styles.dart';

class GenreList extends StatefulWidget {
   GenreList({super.key});
   final List<String> genres = ['Action', 'Drama', 'Comedy', 'Horror', 'Romance'];


   @override
  State<GenreList> createState() => _GenreListState();
}

class _GenreListState extends State<GenreList> {
GenreListView viewModel =GenreListView();
 String selectedGenre='action';


@override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedGenre = getRandomGenre();
    viewModel.getMoviesByGenre(genre: selectedGenre);
  }
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => viewModel,
      child: BlocBuilder<GenreListView,GenreStats>(
          builder: (context, state) {
            if(state is LoadingStats){
              return Center(child: CircularProgressIndicator(),);
            }
            else if(state is ErrorStats){
              return
                Center(child: Column(children: [
                  Text('error',style: AppStyles.bold20white,),
                  ElevatedButton(onPressed: (){
                    viewModel.getMoviesByGenre(genre: getRandomGenre());
                  }, child: Text('try again'))
                ],),);
            }
            else if(state is SuccessStatsByGenre){
              // return Text(state.movies[2].title.toString());
             return Column(
               children: [
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Text(selectedGenre,style: AppStyles.regular20white,),
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
                 SizedBox(
                   height: height*0.3,
                   child: ListView.separated(
                     separatorBuilder: (context, index) {
                       return SizedBox(width: width*0.04,);
                     },
                     scrollDirection: Axis.horizontal,

                     itemBuilder: (context, index) {
                         return ClipRRect(
                           borderRadius: BorderRadius.circular(20),
                           child: InkWell(
                             onTap: () {
                               Navigator.of(context).pushNamed(AppRoutes.details,
                               arguments: state.movies[index].id);
                             },
                             child: Container(
                               color: Colors.transparent,
                               child: Stack(children: [
                                 Image.network('${state.movies[index].mediumCoverImage}',
                                 height: double.infinity,fit: BoxFit.fill,),
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
                                       Text(state.movies[index].rating.toString(),style: AppStyles.regular16white,),
                                       Expanded(child: Icon(Icons.star,color: AppColors.yellow,))
                                     ],
                                   ),
                                 )

                               ],),
                             ),
                           ),
                         );
                       },
                   itemCount: state.movies.length,
                     padding: EdgeInsets.zero,

                   ),
                 ),
               ],
             );
            }
            return Container();
          },
      ),
    );
  }
String getRandomGenre() {
  final random = Random();
  return widget.genres[random.nextInt(widget.genres.length)];
}

}
