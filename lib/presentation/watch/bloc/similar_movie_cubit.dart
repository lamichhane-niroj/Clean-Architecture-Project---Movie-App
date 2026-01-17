import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/domain/movie/usecases/get_similar_movies.dart';
import 'package:spotify_clone/presentation/watch/bloc/similar_movie_state.dart';
import 'package:spotify_clone/service_locator.dart';

class SimilarMovieCubit extends Cubit<SimilarMovieState> {
  SimilarMovieCubit() : super(SimilarMovieLoading());

  void fetchSimilarMovie(int movieId) async {
    var response = await sl<GetSimilarMoviesUseCase>().call(movieId);

    response.fold((error) => emit(SimilarMovieError(errorMessage: error)), (
      similarMovies,
    ) {
      emit(SimilarMovieLoaded(similarMovies: similarMovies));
    });
  }
}
