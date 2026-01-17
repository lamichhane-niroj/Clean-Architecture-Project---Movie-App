import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/domain/movie/usecases/get_recommended_movies.dart';
import 'package:spotify_clone/presentation/watch/bloc/recommended_state.dart';
import 'package:spotify_clone/service_locator.dart';

class RecommendedCubit extends Cubit<RecommendedState> {
  RecommendedCubit() : super(RecommendedLoading());

  void getRecommendedMovies(int id) async {
    var response = await sl<GetRecommendedMoviesUseCase>().call(id);

    response.fold((error) => emit(RecommendedLoadFailed(errorMessage: error)), (
      reccomendedMovies,
    ) {
      emit(RecommendedLoaded(reccomendedMovies));
    });
  }
}
