import 'package:dartz/dartz.dart';
import 'package:spotify_clone/core/usecase/usecase.dart';
import 'package:spotify_clone/domain/tv/entities/tv_content.dart';
import 'package:spotify_clone/domain/tv/repositories/tv_content.dart';
import 'package:spotify_clone/service_locator.dart';

class SearchTvUseCase extends Usecase<Either<String, List<TvContentEntity>>, String> {
  @override
  Future<Either<String, List<TvContentEntity>>> call(String query) {
    return sl<TvContentRepository>().searchTv(query);
  }
}
