import 'package:dartz/dartz.dart';
import 'package:spotify_clone/common/helper/mapper/movie_mapper.dart';
import 'package:spotify_clone/data/movie/data_sources/movie_service.dart';
import 'package:spotify_clone/data/movie/models/movie.dart';
import 'package:spotify_clone/domain/movie/repositories/movie.dart';
import 'package:spotify_clone/service_locator.dart';

class MovieRepositoryImpl extends MovieRepository {
  @override
  Future<Either> getTrendingMovies() async {
    var returnedData = await sl<MovieService>().getTrendingMovies();

    return returnedData.fold((error) => Left(error), (data) {
      var movies = List.from(
        data["content"],
      ).map((item) => MovieMapper.toEntity(MovieModel.fromJson(item))).toList();
      return Right(movies);
    });
  }

  @override
  Future<Either> getNowPlayingMovies() async {
    var returnedData = await sl<MovieService>().getNowPlayingMovies();

    return returnedData.fold((error) => Left(error), (data) {
      var movies = List.from(
        data["content"],
      ).map((item) => MovieMapper.toEntity(MovieModel.fromJson(item))).toList();
      return Right(movies);
    });
  }
}
