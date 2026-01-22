import 'package:dartz/dartz.dart';
import 'package:spotify_clone/core/usecase/usecase.dart';
import 'package:spotify_clone/domain/movie/entities/movie.dart';
import 'package:spotify_clone/domain/movie/repositories/movie.dart';
import 'package:spotify_clone/service_locator.dart';

class GetTrendingMoviesUseCase extends Usecase<Either<String, List<MovieEntity>>, dynamic> {
  @override
  Future<Either<String, List<MovieEntity>>> call(params) {
    return sl<MovieRepository>().getTrendingMovies();
  }
}
