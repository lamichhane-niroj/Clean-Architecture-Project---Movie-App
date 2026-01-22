import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/common/widgets/movie/movie_card.dart';
import 'package:spotify_clone/common/widgets/tv/tv_card.dart';
import 'package:spotify_clone/presentation/search/bloc/search_cubit.dart';
import 'package:spotify_clone/presentation/search/bloc/search_state.dart';

class SearchContent extends StatelessWidget {
  const SearchContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchLoading) {
          return Center(child: CircularProgressIndicator());
        }

        if (state is SearchMoiveLoaded) {
          return GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.6,
            ),
            itemCount: state.movies.length,
            itemBuilder: (context, index) {
              return MovieCard(movieEntity: state.movies[index]);
            },
          );
        }

        if (state is SearchTvLoaded) {
          return GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.6,
            ),
            itemCount: state.tv.length,
            itemBuilder: (context, index) {
              return TvCard(tvEntity: state.tv[index]);
            },
          );
        }

        if (state is SearchFailure) {
          return Center(child: Text(state.errorMessage));
        }

        return Container();
      },
    );
  }
}
