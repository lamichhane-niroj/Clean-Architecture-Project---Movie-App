import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/domain/movie/usecases/search_movie.dart';
import 'package:spotify_clone/domain/tv/usecases/search_tv.dart';
import 'package:spotify_clone/presentation/search/bloc/search_state.dart';
import 'package:spotify_clone/presentation/search/bloc/selected_option_cubit.dart';
import 'package:spotify_clone/service_locator.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitialState());

  void search(String query, SearchType type) {
    emit(SearchLoading());

    switch (type) {
      case SearchType.movie:
        searchMovie(query);
        break;
      case SearchType.tv:
        searchTv(query);
        break;
    }
  }

  void searchMovie(String query) async {
    var returnedData = await sl<SearchMovieUseCase>().call(query);

    returnedData.fold(
      (error) => emit(SearchFailure(errorMessage: error)),
      (data) => emit(SearchMoiveLoaded(movies: data)),
    );
  }

  void searchTv(String query) async {
    var returnedData = await sl<SearchTvUseCase>().call(query);
    returnedData.fold(
      (error) => emit(SearchFailure(errorMessage: error)),
      (data) => emit(SearchTvLoaded(tv: data)),
    );
  }
}
