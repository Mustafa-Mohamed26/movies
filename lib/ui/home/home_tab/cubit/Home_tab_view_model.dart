import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/api/api_manager.dart';
import 'package:movies/ui/home/home_tab/cubit/movies_stats.dart';

class HomeViewModel extends Cubit<MoviesStats>{
  HomeViewModel():super(LoadingStats());

  //todo hold data handel logic




void getNewMoviesList()async{
  // todo Loading
  emit(LoadingStats());
  try{
  var movies = await ApiManager.getNewMoviesList();
  //todo error
  if(movies.status!='ok'){
    emit(ErrorStats(errorMessage: movies.statusMessage!));
  }else{
    //todo success
    emit(SuccessStats(movies: movies.data!.movies!));

  }}catch(e){
    emit(ErrorStats(errorMessage: e.toString()));
  }
}


}