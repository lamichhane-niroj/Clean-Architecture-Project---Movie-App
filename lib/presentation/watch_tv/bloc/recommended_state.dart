import 'package:spotify_clone/domain/tv/entities/tv_content.dart';

abstract class RecommendedState {}

class RecommendedLoading extends RecommendedState{}

class RecommendedLoaded extends RecommendedState{
  final List<TvContentEntity> recommendedTv;

  RecommendedLoaded({required this.recommendedTv});
}

class RecommendedLoadFailed extends RecommendedState{
  final String errorMessage;
  RecommendedLoadFailed({required this.errorMessage});
}

