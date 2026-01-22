import 'package:dartz/dartz.dart';
import 'package:spotify_clone/core/usecase/usecase.dart';
import 'package:spotify_clone/domain/movie/entities/trailer.dart';
import 'package:spotify_clone/domain/tv/repositories/tv_content.dart';
import 'package:spotify_clone/service_locator.dart';

class GetTvTrailerUseCase extends Usecase<Either<String, TrailerEntity>, int> {
  @override
  Future<Either<String, TrailerEntity>> call(id) {
    return sl<TvContentRepository>().getTvTrailer(id);
  }
}
