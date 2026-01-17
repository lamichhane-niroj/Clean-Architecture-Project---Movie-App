import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/common/widgets/movie/movie_card.dart';
import 'package:spotify_clone/presentation/watch/bloc/similar_movie_cubit.dart';
import 'package:spotify_clone/presentation/watch/bloc/similar_movie_state.dart';

class SimilarMovies extends StatelessWidget {
  const SimilarMovies({super.key, required this.movieId});

  final int movieId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SimilarMovieCubit()..fetchSimilarMovie(movieId),
      child: BlocBuilder<SimilarMovieCubit, SimilarMovieState>(
        builder: (context, state) {
          if (state is SimilarMovieLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (state is SimilarMovieLoaded) {
            return SizedBox(
              height: 300,
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 16),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) =>
                    MovieCard(movieEntity: state.similarMovies[index]),
                separatorBuilder: (context, index) => SizedBox(width: 10),
                itemCount: state.similarMovies.length,
              ),
            );
          }

          if (state is SimilarMovieError) {
            return Text(state.errorMessage);
          }

          return SizedBox();
        },
      ),
    );
  }
}
