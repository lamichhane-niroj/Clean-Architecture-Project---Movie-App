import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:spotify_clone/core/constants/api_url.dart';
import 'package:spotify_clone/core/network/dio_client.dart';
import 'package:spotify_clone/service_locator.dart';

abstract class MovieService {
  Future<Either> getTrendingMovies();
  Future<Either> getNowPlayingMovies();
  Future<Either> getMovieTrailer(int id);
  Future<Either> getRecommendedMovie(int id);
  Future<Either> getSimilarMovie(int id);
  Future<Either> searchMovie(String query);
}

class MovieServiceImpl implements MovieService {
  @override
  Future<Either> getTrendingMovies() async {
    try {
      var response = await sl<DioClient>().get(ApiUrl.trendingMovies);
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response?.data["message"] ?? "An error occurred");
    }
  }

  @override
  Future<Either> getNowPlayingMovies() async {
    try {
      var response = await sl<DioClient>().get(ApiUrl.nowPlayingMovies);
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response?.data["message"] ?? "An error occurred");
    }
  }

  @override
  Future<Either> getMovieTrailer(int id) async {
    try {
      final endPoint = "${ApiUrl.movie}$id/trailer";
      var response = await sl<DioClient>().get(endPoint);
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response?.data["message"] ?? "An error occurred");
    }
  }

  @override
  Future<Either> getRecommendedMovie(int id) async {
    try {
      final endPoint = "${ApiUrl.movie}$id/recommendations";
      var response = await sl<DioClient>().get(endPoint);
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response?.data["message"] ?? "An error occurred");
    }
  }

  @override
  Future<Either> getSimilarMovie(int id) async {
    try {
      final endPoint = "${ApiUrl.movie}$id/similar";
      var response = await sl<DioClient>().get(endPoint);
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response?.data["message"] ?? "An error occurred");
    }
  }

  @override
  Future<Either> searchMovie(String query) async {
    try {
      final endPoint = "${ApiUrl.search}movie/$query";
      var response = await sl<DioClient>().get(endPoint);
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response?.data["message"] ?? "An error occurred");
    }
  }
}
