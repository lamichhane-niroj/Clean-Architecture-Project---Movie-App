import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:spotify_clone/core/constants/api_url.dart';
import 'package:spotify_clone/core/network/dio_client.dart';
import 'package:spotify_clone/service_locator.dart';

abstract class TvContentService {
  Future<Either<String, Map<String, dynamic>>> getPopularTv();
  Future<Either<String, Map<String, dynamic>>> getTvTrailer(int id);
  Future<Either<String, Map<String, dynamic>>> getRecommendedTv(int id);
  Future<Either<String, Map<String, dynamic>>> getSimilarTv(int id);
  Future<Either<String, Map<String, dynamic>>> searchTv(String query);
}

class TvContentServiceImpl extends TvContentService {
  @override
  Future<Either<String, Map<String, dynamic>>> getPopularTv() async {
    try {
      var response = await sl<DioClient>().get(ApiUrl.popularTvShows);
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response?.data["message"] ?? "An error occurred");
    }
  }

  @override
  Future<Either<String, Map<String, dynamic>>> getRecommendedTv(int id) async {
    try {
      final endPoint = "${ApiUrl.tv}$id/recommendations";
      var response = await sl<DioClient>().get(endPoint);
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response?.data["message"] ?? "An error occurred");
    }
  }

  @override
  Future<Either<String, Map<String, dynamic>>> getSimilarTv(int id) async {
    try {
      final endPoint = "${ApiUrl.tv}$id/similar";
      var response = await sl<DioClient>().get(endPoint);
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response?.data["message"] ?? "An error occurred");
    }
  }

  @override
  Future<Either<String, Map<String, dynamic>>> getTvTrailer(int id) async {
    try {
      final endPoint = "${ApiUrl.tv}$id/trailers";
      var response = await sl<DioClient>().get(endPoint);
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response?.data["message"] ?? "An error occurred");
    }
  }

  @override
  Future<Either<String, Map<String, dynamic>>> searchTv(String query) async {
    try {
      final endPoint = "${ApiUrl.search}tv/$query";
      var response = await sl<DioClient>().get(endPoint);
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response?.data["message"] ?? "An error occurred");
    }
  }
}
