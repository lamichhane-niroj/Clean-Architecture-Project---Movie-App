import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/presentation/watch/bloc/trailer_cubit.dart';
import 'package:spotify_clone/presentation/watch/bloc/trailer_state.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayer extends StatelessWidget {
  const VideoPlayer({super.key, required this.movieId});

  final int movieId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TrailerCubit()..getMovieTrailer(movieId),
      child: BlocBuilder<TrailerCubit, TrailerState>(
        builder: (context, state) {
          if (state is TrailerLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (state is TrailerLoaded) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: YoutubePlayer(
                controller: state.youtubePlayerController,
                showVideoProgressIndicator: true,
              ),
            );
          }

          if (state is TrailerLoadFailure) {
            return Center(child: Text(state.errorMessage));
          }

          return Container();
        },
      ),
    );
  }
}
