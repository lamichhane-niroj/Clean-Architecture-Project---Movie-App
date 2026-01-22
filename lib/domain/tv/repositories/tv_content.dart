import 'package:dartz/dartz.dart';

abstract class TvContentRepository {
  Future<Either> getPopularTvContent();
  Future<Either> getTvTrailer(int id);
  Future<Either> getRecommendedTv(int id);
  Future<Either> getSimilarTv(int id);
  Future<Either> searchTv(String query);
}
