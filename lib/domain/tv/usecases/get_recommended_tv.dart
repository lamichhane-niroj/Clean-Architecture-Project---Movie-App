import 'package:dartz/dartz.dart';
import 'package:spotify_clone/core/usecase/usecase.dart';
import 'package:spotify_clone/domain/tv/repositories/tv_content.dart';
import 'package:spotify_clone/service_locator.dart';

class GetRecommendedTvUseCase extends Usecase<Either, int> {
  @override
  Future<Either> call(id) {
    return sl<TvContentRepository>().getRecommendedTv(id);
  }
}
