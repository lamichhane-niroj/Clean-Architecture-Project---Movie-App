import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/common/widgets/tv/tv_card.dart';
import 'package:spotify_clone/presentation/watch_tv/bloc/recommended_cubit.dart';
import 'package:spotify_clone/presentation/watch_tv/bloc/recommended_state.dart';


class RecommendedTv extends StatelessWidget {
  const RecommendedTv({super.key, required this.tvId});

  final int tvId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RecommendedCubit()..getRecommendedTv(tvId),
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
                    TvCard(tvEntity: state.recommendedTv[index]),
                separatorBuilder: (context, index) => SizedBox(width: 10),
                itemCount: state.recommendedTv.length,
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
