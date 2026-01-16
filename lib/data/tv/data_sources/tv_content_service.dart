import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:spotify_clone/core/constants/api_url.dart';
import 'package:spotify_clone/core/network/dio_client.dart';
import 'package:spotify_clone/service_locator.dart';

abstract class TvContentService {
  Future<Either> getPopularTv();
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
}
