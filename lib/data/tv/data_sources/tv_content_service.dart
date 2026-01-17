import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:spotify_clone/core/constants/api_url.dart';
import 'package:spotify_clone/core/network/dio_client.dart';
import 'package:spotify_clone/service_locator.dart';

abstract class TvContentService {
  Future<Either> getPopularTv();
  Future<Either> getTvTrailer(int id);
  Future<Either> getRecommendedTv(int id);
  Future<Either> getSimilarTv(int id);
}

class TvContentServiceImpl extends TvContentService {
  @override
  Future<Either> getPopularTv() async {
    try {
      var response = await sl<DioClient>().get(ApiUrl.popularTvShows);
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response?.data["message"] ?? "An error occurred");
    }
  }

  @override
  Future<Either> getRecommendedTv(int id) async {
    try {
      final endPoint = "${ApiUrl.tv}$id/recommendations";
      var response = await sl<DioClient>().get(endPoint);
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response?.data["message"] ?? "An error occurred");
    }
  }

  @override
  Future<Either> getSimilarTv(int id) async {
    try {
      final endPoint = "${ApiUrl.tv}$id/similar";
      var response = await sl<DioClient>().get(endPoint);
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response?.data["message"] ?? "An error occurred");
    }
  }

  @override
  Future<Either> getTvTrailer(int id) async {
    try {
      final endPoint = "${ApiUrl.tv}$id/trailers";
      var response = await sl<DioClient>().get(endPoint);
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response?.data["message"] ?? "An error occurred");
    }
  }
}
