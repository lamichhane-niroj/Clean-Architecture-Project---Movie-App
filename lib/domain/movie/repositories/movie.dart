import 'package:dartz/dartz.dart';

abstract class MovieRepository {
  Future<Either> getTrendingMovies();
  Future<Either> getNowPlayingMovies();
  Future<Either> getMovieTrailer(int id);
  Future<Either> getRecommendedMovie(int id);
  Future<Either> getSimilarMovie(int id);
}
