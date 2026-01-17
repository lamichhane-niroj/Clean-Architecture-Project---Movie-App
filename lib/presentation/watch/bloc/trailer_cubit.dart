import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/domain/movie/entities/trailer.dart';
import 'package:spotify_clone/domain/movie/usecases/get_movie_trailer.dart';
import 'package:spotify_clone/presentation/watch/bloc/trailer_state.dart';
import 'package:spotify_clone/service_locator.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TrailerCubit extends Cubit<TrailerState> {
  TrailerCubit() : super(TrailerLoading());

  void getMovieTrailer(int movieId) async {
    var returnedData = await sl<GetMovieTrailerUseCase>().call(movieId);

    returnedData.fold(
      (error) => emit(TrailerLoadFailure(errorMessage: error)),
      (data) async {
        final TrailerEntity trailer = data;
        YoutubePlayerController controller = YoutubePlayerController(
          initialVideoId: trailer.key!,
          flags: YoutubePlayerFlags(autoPlay: false, mute: true),
        );
        emit(
          TrailerLoaded(
            youtubePlayerController: controller
          ),
        );
      },
    );
  }
}
