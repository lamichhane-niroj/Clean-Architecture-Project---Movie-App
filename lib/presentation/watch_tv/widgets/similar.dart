import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/common/widgets/tv/tv_card.dart';
import 'package:spotify_clone/presentation/watch_tv/bloc/similar_tv_cubit.dart';
import 'package:spotify_clone/presentation/watch_tv/bloc/similar_tv_state.dart';

class SimilarTv extends StatelessWidget {
  const SimilarTv({super.key, required this.tvId});

  final int tvId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SimilarTvCubit()..fetchSimilarTv(tvId),
      child: BlocBuilder<SimilarTvCubit, SimilarTvState>(
        builder: (context, state) {
          if (state is SimilarTvLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (state is SimilarTvLoaded) {
            return SizedBox(
              height: 300,
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 16),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) =>
                    TvCard(tvEntity: state.similarTvs[index]),
                separatorBuilder: (context, index) => SizedBox(width: 10),
                itemCount: state.similarTvs.length,
              ),
            );
          }

          if (state is SimilarTvError) {
            return Text(state.errorMessage);
          }

          return SizedBox();
        },
      ),
    );
  }
}
