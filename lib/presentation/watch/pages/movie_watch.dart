import 'package:flutter/material.dart';
import 'package:spotify_clone/domain/movie/entities/movie.dart';
import 'package:spotify_clone/presentation/watch/widgets/overview.dart';
import 'package:spotify_clone/presentation/watch/widgets/recommended.dart';
import 'package:spotify_clone/presentation/watch/widgets/release_date.dart';
import 'package:spotify_clone/presentation/watch/widgets/similar.dart';
import 'package:spotify_clone/presentation/watch/widgets/title_text.dart';
import 'package:spotify_clone/presentation/watch/widgets/video_player.dart';

class MovieWatchPage extends StatelessWidget {
  const MovieWatchPage({super.key, required this.movie});

  final MovieEntity movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VideoPlayer(movieId: movie.id!),
            TitleText(title: movie.title!),
            ReleaseDate(releaseDate: movie.releaseDate!),
            SizedBox(height: 10),
            MovieOverview(overview: movie.overview!),
            TitleText(title: "Recommendation"),
            SizedBox(height: 10),
            RecommendedMovies(movieId: movie.id!),
            TitleText(title: "Similar"),
            SizedBox(height: 10),
            SimilarMovies(movieId: movie.id!),
          ],
        ),
      ),
    );
  }
}
