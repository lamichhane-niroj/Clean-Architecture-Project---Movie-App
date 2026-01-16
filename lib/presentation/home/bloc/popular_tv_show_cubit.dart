import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/domain/tv/usecases/get_popular_tv_content.dart';
import 'package:spotify_clone/presentation/home/bloc/popular_tv_show_state.dart';
import 'package:spotify_clone/service_locator.dart';

class PopularTvShowCubit extends Cubit<PopularTvShowState> {
  PopularTvShowCubit() : super(PopularTvShowLoading());

  void getPopularTvShows() async {
    var response = await sl<GetPopularTvContentUseCase>().call(null);

    response.fold((error) => emit(PopularTvShowError(message: error)), (
      populaMovies,
    ) {
      emit(PopularTvShowLoaded(tvShows: populaMovies));
    });
  }
}
