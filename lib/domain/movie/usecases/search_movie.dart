import 'package:dartz/dartz.dart';
import 'package:spotify_clone/core/usecase/usecase.dart';
import 'package:spotify_clone/domain/movie/repositories/movie.dart';
import 'package:spotify_clone/service_locator.dart';

class SearchMovieUseCase extends Usecase<Either, String> {
  @override
  Future<Either> call(String query) {
    return sl<MovieRepository>().searchMovie(query);
  }
}
