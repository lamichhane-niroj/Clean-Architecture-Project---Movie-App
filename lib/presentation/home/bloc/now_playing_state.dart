import 'package:spotify_clone/domain/movie/entities/movie.dart';

abstract class NowPlayingState {}

class NowPlayingLoadingState extends NowPlayingState{}

class NowPlayingLoadedState extends NowPlayingState{
  final List<MovieEntity> movies;
  NowPlayingLoadedState({required this.movies}); 
}

class NowPlayingErrorState extends NowPlayingState{
  final String errorMessage;
  NowPlayingErrorState({required this.errorMessage});
}
