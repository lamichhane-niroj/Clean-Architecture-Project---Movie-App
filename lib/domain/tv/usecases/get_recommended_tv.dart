import 'package:dartz/dartz.dart';
import 'package:spotify_clone/core/usecase/usecase.dart';
import 'package:spotify_clone/domain/tv/entities/tv_content.dart';
import 'package:spotify_clone/domain/tv/repositories/tv_content.dart';
import 'package:spotify_clone/service_locator.dart';

class GetRecommendedTvUseCase extends Usecase<Either<String, List<TvContentEntity>>, int> {
  @override
  Future<Either<String, List<TvContentEntity>>> call(id) {
    return sl<TvContentRepository>().getRecommendedTv(id);
  }
}
