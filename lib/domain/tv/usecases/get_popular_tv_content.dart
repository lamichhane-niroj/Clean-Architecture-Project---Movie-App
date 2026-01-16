import 'package:dartz/dartz.dart';
import 'package:spotify_clone/core/usecase/usecase.dart';
import 'package:spotify_clone/domain/tv/repositories/tv_content.dart';
import 'package:spotify_clone/service_locator.dart';

class GetPopularTvContentUseCase extends Usecase<Either, dynamic> {
  @override
  Future<Either> call(params) {
    return sl<TvContentRepository>().getPopularTvContent();
  }
}
