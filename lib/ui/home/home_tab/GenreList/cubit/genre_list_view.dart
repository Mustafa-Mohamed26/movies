import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/ui/home/home_tab/GenreList/cubit/genry_stats.dart';

import '../../../../../api/api_manager.dart';

class GenreListView extends Cubit<GenreStats>{
  GenreListView():super(LoadingStats());
  // todo hold data handel logic
  void getMoviesByGenre({required String genre})async{
    try{
      //todo Loading
      emit(LoadingStats());
      var movies = await ApiManager.getNewMoviesListByGenre(genre);
      if(movies.status!='ok'){
        //todo error
        emit(ErrorStats(errorMessage:'some thing erorr'));
      }
      if(movies.status=='ok'){
        // todo success
        emit(SuccessStatsByGenre(movies: movies.data!.movies!));
      }
    }catch(e){
      emit(ErrorStats(errorMessage: e.toString()));
    }
  }
}