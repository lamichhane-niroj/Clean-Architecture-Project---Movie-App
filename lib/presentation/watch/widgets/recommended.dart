import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/common/widgets/movie/movie_card.dart';
import 'package:spotify_clone/presentation/watch/bloc/recommended_cubit.dart';
import 'package:spotify_clone/presentation/watch/bloc/recommended_state.dart';

class RecommendedMovies extends StatelessWidget {
  const RecommendedMovies({super.key, required this.movieId});

  final int movieId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RecommendedCubit()..getRecommendedMovies(movieId),
      child: BlocBuilder<RecommendedCubit, RecommendedState>(
        builder: (context, state) {
          if (state is RecommendedLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (state is RecommendedLoaded) {
            return SizedBox(
              height: 300,
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 16),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) =>
                    MovieCard(movieEntity: state.recommendedMovie[index]),
                separatorBuilder: (context, index) => SizedBox(width: 10),
                itemCount: state.recommendedMovie.length,
              ),
            );
          }

          if (state is RecommendedLoadFailed) {
            return Text(state.errorMessage);
          }

          return SizedBox();
        },
      ),
    );
  }
}
