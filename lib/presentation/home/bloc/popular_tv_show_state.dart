import 'package:spotify_clone/domain/tv/entities/tv_content.dart';

abstract class PopularTvShowState {}

class PopularTvShowLoading extends PopularTvShowState{}

class PopularTvShowLoaded extends PopularTvShowState{
  final List<TvContentEntity> tvShows;
  
  PopularTvShowLoaded({required this.tvShows});
}

class PopularTvShowError extends PopularTvShowState{
  final String message;

  PopularTvShowError({required this.message});
}