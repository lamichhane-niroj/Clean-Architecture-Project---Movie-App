import 'package:spotify_clone/domain/movie/entities/movie.dart';

abstract class RecommendedState {}

class RecommendedLoading extends RecommendedState{}

class RecommendedLoaded extends RecommendedState{
  final List<MovieEntity> recommendedMovie;

  RecommendedLoaded(this.recommendedMovie);
}

class RecommendedLoadFailed extends RecommendedState{
  final String errorMessage;
  RecommendedLoadFailed({required this.errorMessage});
}

