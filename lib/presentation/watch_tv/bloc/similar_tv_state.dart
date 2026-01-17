import 'package:spotify_clone/domain/tv/entities/tv_content.dart';

abstract class SimilarTvState {}

class SimilarTvLoading extends SimilarTvState {}

class SimilarTvLoaded extends SimilarTvState {
  SimilarTvLoaded({required this.similarTvs});

  final List<TvContentEntity> similarTvs;
}

class SimilarTvError extends SimilarTvState {
  final String errorMessage;

  SimilarTvError({required this.errorMessage});
}
