import 'package:dartz/dartz.dart';
import 'package:spotify_clone/core/usecase/usecase.dart';
import 'package:spotify_clone/domain/movie/repositories/movie.dart';
import 'package:spotify_clone/service_locator.dart';

class GetTrendingMoviesUseCase implements Usecase<Either, dynamic>{
  @override
  Future<Either> call(params)async {
    return await sl<MovieRepository>().getTrendingMovies();
  }

}