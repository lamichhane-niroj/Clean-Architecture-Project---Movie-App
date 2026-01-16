import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/domain/movie/usecases/get_trending_movies.dart';
import 'package:spotify_clone/presentation/home/bloc/trending_state.dart';
import 'package:spotify_clone/service_locator.dart';

class TrendingCubit extends Cubit<TrendingState>{
  TrendingCubit(): super(TrendingMoviesLoading());

  void getTrendingMovies() async {
    var trendingMovies = await sl<GetTrendingMoviesUseCase>().call(null);
    trendingMovies.fold(
      (error) => emit(TrendingMovieLoadFailure(errorMessage: error)), 
      (movies){
        emit(TrendingMoviesLoaded(movies: movies));
      });
  }


}