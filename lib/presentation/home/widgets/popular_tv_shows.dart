import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/presentation/home/bloc/popular_tv_show_cubit.dart';
import 'package:spotify_clone/presentation/home/bloc/popular_tv_show_state.dart';

class PopularTvShows extends StatelessWidget {
  const PopularTvShows({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PopularTvShowCubit()..getPopularTvShows(),
      child: BlocBuilder<PopularTvShowCubit, PopularTvShowState>(
        builder: (context, state) {
          if (state is PopularTvShowLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (state is PopularTvShowLoaded) {
            return SizedBox(
              height: 300,
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 16),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) =>
                    Text(state.tvShows[index].name!),
                separatorBuilder: (context, index) => SizedBox(width: 10),
                itemCount: state.tvShows.length,
              ),
            );
          }

          if (state is PopularTvShowError) {
            return Text(state.message);
          }

          return SizedBox();
        },
      ),
    );
  }
}
