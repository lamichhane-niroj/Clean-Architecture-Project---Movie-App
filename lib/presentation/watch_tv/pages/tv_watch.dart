import 'package:flutter/material.dart';
import 'package:spotify_clone/domain/tv/entities/tv_content.dart';
import 'package:spotify_clone/presentation/watch_tv/widgets/overview.dart';
import 'package:spotify_clone/presentation/watch_tv/widgets/recommended.dart';
import 'package:spotify_clone/presentation/watch_tv/widgets/release_date.dart';
import 'package:spotify_clone/presentation/watch_tv/widgets/similar.dart';
import 'package:spotify_clone/presentation/watch_tv/widgets/title_text.dart';
import 'package:spotify_clone/presentation/watch_tv/widgets/video_player.dart';

class TvWatchPage extends StatelessWidget {
  const TvWatchPage({super.key, required this.tvContent});

  final TvContentEntity tvContent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VideoPlayer(tvId: tvContent.id!),
            TitleText(title: tvContent.name!),
            ReleaseDate(releaseDate: tvContent.firstAirDate!),
            SizedBox(height: 10),
            MovieOverview(overview: tvContent.overview!),
            TitleText(title: "Recommendation"),
            SizedBox(height: 10),
            RecommendedTv(tvId: tvContent.id!),
            TitleText(title: "Similar"),
            SizedBox(height: 10),
            SimilarTv(tvId: tvContent.id!),
          ],
        ),
      ),
    );
  }
}
