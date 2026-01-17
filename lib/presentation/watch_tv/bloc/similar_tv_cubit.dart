import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/domain/tv/usecases/get_similar_tv.dart';
import 'package:spotify_clone/presentation/watch_tv/bloc/similar_tv_state.dart';
import 'package:spotify_clone/service_locator.dart';

class SimilarTvCubit extends Cubit<SimilarTvState> {
  SimilarTvCubit() : super(SimilarTvLoading());

  void fetchSimilarTv(int movieId) async {
    var response = await sl<GetSimilarTvUseCase>().call(movieId);

    response.fold((error) => emit(SimilarTvError(errorMessage: error)), (
      similarMovies,
    ) {
      emit(SimilarTvLoaded(similarTvs: similarMovies));
    });
  }
}
