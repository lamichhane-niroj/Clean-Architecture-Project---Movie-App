import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/core/configs/assets/app_images.dart';
import 'package:spotify_clone/presentation/home/bloc/trending_cubit.dart';
import 'package:spotify_clone/presentation/home/bloc/trending_state.dart';
import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';

class TrendingMovies extends StatelessWidget {
  const TrendingMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TrendingCubit()..getTrendingMovies(),
      child: BlocBuilder<TrendingCubit, TrendingState>(
        builder: (context, state) {
          if (state is TrendingMoviesLoading) {
            return CircularProgressIndicator();
          }

          if (state is TrendingMoviesLoaded) {
            return FanCarouselImageSlider.sliderType1(
              imagesLink: state.movies
                  .map(
                    (item) =>
                        AppImages.moviesImageBasePath +
                        item.posterPath.toString(),
                  )
                  .toList(),
              isAssets: false,
              autoPlay: false,
              sliderHeight: 400,
              showIndicator: true,
            );
          }

          if (state is TrendingMovieLoadFailure) {
            return Center(child: Text(state.errorMessage.toString()));
          }

          return Container();
        },
      ),
    );
  }
}
