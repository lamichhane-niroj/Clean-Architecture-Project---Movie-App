import 'package:dartz/dartz.dart';
import 'package:spotify_clone/core/usecase/usecase.dart';
import 'package:spotify_clone/domain/tv/repositories/tv_content.dart';
import 'package:spotify_clone/service_locator.dart';

class GetSimilarTvUseCase extends Usecase<Either, int> {
  @override
  Future<Either> call(int movieId) {
    return sl<TvContentRepository>().getSimilarTv(movieId);
  }
}
