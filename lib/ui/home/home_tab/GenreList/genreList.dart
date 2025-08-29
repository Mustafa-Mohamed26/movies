import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/ui/home/home_tab/GenreList/cubit/genre_list_view.dart';
import 'package:movies/ui/home/home_tab/GenreList/cubit/genry_stats.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_styles.dart';

class GenreList extends StatefulWidget {
   GenreList({super.key});

  @override
  State<GenreList> createState() => _GenreListState();
}

class _GenreListState extends State<GenreList> {
GenreListView viewModel =GenreListView();

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getMoviesByGenre();
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
                  ElevatedButton(onPressed: viewModel.getMoviesByGenre, child: Text('try again'))
                ],),);
            }
            else if(state is SuccessStatsByGenre){
              // return Text(state.movies[2].title.toString());
             return SizedBox(
               height: height,
               child: GridView.builder(
                 scrollDirection: Axis.vertical,
                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,
                       childAspectRatio: height*0.0006,
                       crossAxisSpacing: 12,
                       mainAxisSpacing: 12,

                   ),
                 itemBuilder: (context, index) {
                     return ClipRRect(
                       borderRadius: BorderRadius.circular(20),
                       child: Container(
                         color: Colors.white,
                         child: Stack(children: [
                           Image.network('${state.movies[index].mediumCoverImage}',
                           width: double.infinity,height: double.infinity,fit: BoxFit.fill,),
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
                                 Icon(Icons.star,color: AppColors.yellow,)
                               ],
                             ),
                           )

                         ],),
                       ),
                     );
                   },
               itemCount: 3,
                 padding: EdgeInsets.zero,

               ),
             );
            }
            return Container();
          },
      ),
    );
  }
}
