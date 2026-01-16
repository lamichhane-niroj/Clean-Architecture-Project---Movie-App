import 'package:spotify_clone/domain/movie/entities/movie.dart';

abstract class TrendingState {}

class TrendingMoviesLoading extends TrendingState{}

class TrendingMoviesLoaded extends TrendingState{
  final List<MovieEntity> movies;
  TrendingMoviesLoaded({required this.movies});
}

class TrendingMovieLoadFailure extends TrendingState{
  final String errorMessage;
  TrendingMovieLoadFailure({required this.errorMessage});
}