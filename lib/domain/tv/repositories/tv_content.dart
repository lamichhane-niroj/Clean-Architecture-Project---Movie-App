import 'package:dartz/dartz.dart';
import 'package:spotify_clone/domain/movie/entities/trailer.dart';
import 'package:spotify_clone/domain/tv/entities/tv_content.dart';

abstract class TvContentRepository {
  Future<Either<String, List<TvContentEntity>>> getPopularTvContent();
  Future<Either<String, TrailerEntity>> getTvTrailer(int id);
  Future<Either<String, List<TvContentEntity>>> getRecommendedTv(int id);
  Future<Either<String, List<TvContentEntity>>> getSimilarTv(int id);
  Future<Either<String, List<TvContentEntity>>> searchTv(String query);
}
