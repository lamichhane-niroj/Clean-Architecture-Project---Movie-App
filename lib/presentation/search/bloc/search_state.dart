import 'package:spotify_clone/domain/movie/entities/movie.dart';
import 'package:spotify_clone/domain/tv/entities/tv_content.dart';

abstract class SearchState {}

class SearchInitialState extends SearchState {}

class SearchLoading extends SearchState {}

class SearchMoiveLoaded extends SearchState {
  final List<MovieEntity> movies;

  SearchMoiveLoaded({required this.movies});
}

class SearchTvLoaded extends SearchState {
  final List<TvContentEntity> tv;

  SearchTvLoaded({required this.tv});
}

class SearchFailure extends SearchState {
  final String errorMessage;

  SearchFailure({required this.errorMessage});
}
