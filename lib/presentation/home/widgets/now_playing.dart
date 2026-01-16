import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/common/widgets/movie/movie_card.dart';
import 'package:spotify_clone/presentation/home/bloc/now_playing_cubit.dart';
import 'package:spotify_clone/presentation/home/bloc/now_playing_state.dart';

class NowPlayingMovies extends StatelessWidget {
  const NowPlayingMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NowPlayingCubit()..getNowPlayingMovies(),
      child: BlocBuilder<NowPlayingCubit, NowPlayingState>(
        builder: (context, state) {
          if (state is NowPlayingLoadingState) {
            return Center(child: CircularProgressIndicator());
          }

          if (state is NowPlayingLoadedState) {
            return SizedBox(
              height: 300,
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 16),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) =>
                    MovieCard(movieEntity: state.movies[index]),
                separatorBuilder: (context, index) => SizedBox(width: 10),
                itemCount: state.movies.length,
              ),
            );
          }

          if (state is NowPlayingErrorState) {
            return Text(state.errorMessage);
          }

          return SizedBox();
        },
      ),
    );
  }
}
