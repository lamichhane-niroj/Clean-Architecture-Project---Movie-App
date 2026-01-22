import 'package:dartz/dartz.dart';
import 'package:spotify_clone/common/helper/mapper/movie_mapper.dart';
import 'package:spotify_clone/common/helper/mapper/trailer_mapper.dart';
import 'package:spotify_clone/data/movie/data_sources/movie_service.dart';
import 'package:spotify_clone/data/movie/models/movie.dart';
import 'package:spotify_clone/data/movie/models/trailer.dart';
import 'package:spotify_clone/domain/movie/entities/movie.dart';
import 'package:spotify_clone/domain/movie/entities/trailer.dart';
import 'package:spotify_clone/domain/movie/repositories/movie.dart';
import 'package:spotify_clone/service_locator.dart';

class MovieRepositoryImpl extends MovieRepository {
  @override
  Future<Either<String, List<MovieEntity>>> getTrendingMovies() async {
    var returnedData = await sl<MovieService>().getTrendingMovies();

    return returnedData.fold((error) => Left(error), (data) {
      var movies = List.from(
        data["content"],
      ).map((item) => MovieMapper.toEntity(MovieModel.fromJson(item))).toList();
      return Right(movies);
    });
  }

  @override
  Future<Either<String, List<MovieEntity>>> getNowPlayingMovies() async {
    var returnedData = await sl<MovieService>().getNowPlayingMovies();

    return returnedData.fold((error) => Left(error), (data) {
      var movies = List.from(
        data["content"],
      ).map((item) => MovieMapper.toEntity(MovieModel.fromJson(item))).toList();
      return Right(movies);
    });
  }

  @override
  Future<Either<String, TrailerEntity>> getMovieTrailer(int movieId) async {
    var returnedData = await sl<MovieService>().getMovieTrailer(movieId);

    return returnedData.fold((error) => Left(error), (data) {
      var trailer = data['trailer'];
      var trailerEntity = TrailerMapper.toEntity(
        TrailerModel.fromJson(trailer),
      );
      return Right(trailerEntity);
    });
  }

  @override
  Future<Either<String, List<MovieEntity>>> getRecommendedMovie(int id) async {
    var returnedData = await sl<MovieService>().getRecommendedMovie(id);
    return returnedData.fold((error) => Left(error), (data) {
      var movies = List.from(
        data["content"],
      ).map((item) => MovieMapper.toEntity(MovieModel.fromJson(item))).toList();
      return Right(movies);
    });
  }

  @override
  Future<Either<String, List<MovieEntity>>> getSimilarMovie(int id) async {
    var returnedData = await sl<MovieService>().getSimilarMovie(id);
    return returnedData.fold((error) => Left(error), (data) {
      var movies = List.from(
        data["content"],
      ).map((item) => MovieMapper.toEntity(MovieModel.fromJson(item))).toList();
      return Right(movies);
    });
  }

  @override
  Future<Either<String, List<MovieEntity>>> searchMovie(String query) async {
    var returnedData = await sl<MovieService>().searchMovie(query);
    return returnedData.fold((error) => Left(error), (data) {
      var movies = List.from(
        data["content"],
      ).map((item) => MovieMapper.toEntity(MovieModel.fromJson(item))).toList();
      return Right(movies);
    });
  }
}
