import 'package:spotify_clone/domain/movie/entities/movie.dart';

abstract class SimilarMovieState {}

class SimilarMovieLoading extends SimilarMovieState{}

class SimilarMovieLoaded extends SimilarMovieState{
  SimilarMovieLoaded({required this.similarMovies});

  final List<MovieEntity> similarMovies;
}

class SimilarMovieError extends SimilarMovieState{
  final String errorMessage;

  SimilarMovieError({required this.errorMessage});
}