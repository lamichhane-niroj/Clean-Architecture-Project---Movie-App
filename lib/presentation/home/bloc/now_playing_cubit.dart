import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/domain/movie/usecases/get_now_playing_movies.dart';
import 'package:spotify_clone/presentation/home/bloc/now_playing_state.dart';
import 'package:spotify_clone/service_locator.dart';

class NowPlayingCubit extends Cubit<NowPlayingState>{
  NowPlayingCubit(): super(NowPlayingLoadingState());

   void getNowPlayingMovies() async {
    var nowPlayingMovies = await sl<GetNowPlayingMoviesUseCase>().call(null);
    nowPlayingMovies.fold(
      (error) => emit(NowPlayingErrorState(errorMessage: error)), 
      (movies){
        emit(NowPlayingLoadedState(movies: movies));
      });
  }


}