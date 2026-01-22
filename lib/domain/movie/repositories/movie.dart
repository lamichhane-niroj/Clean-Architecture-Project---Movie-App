import 'package:dartz/dartz.dart';
import 'package:spotify_clone/domain/movie/entities/movie.dart';
import 'package:spotify_clone/domain/movie/entities/trailer.dart';

abstract class MovieRepository {
  Future<Either<String, List<MovieEntity>>> getTrendingMovies();
  Future<Either<String, List<MovieEntity>>> getNowPlayingMovies();
  Future<Either<String, TrailerEntity>> getMovieTrailer(int id);
  Future<Either<String, List<MovieEntity>>> getRecommendedMovie(int id);
  Future<Either<String, List<MovieEntity>>> getSimilarMovie(int id);
  Future<Either<String, List<MovieEntity>>> searchMovie(String query);
}
