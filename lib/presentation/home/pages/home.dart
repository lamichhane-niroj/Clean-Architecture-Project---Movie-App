import 'package:flutter/material.dart';
import 'package:spotify_clone/presentation/home/widgets/now_playing.dart';
import 'package:spotify_clone/presentation/home/widgets/popular_tv_shows.dart';
import 'package:spotify_clone/presentation/home/widgets/trending.dart';
import 'package:spotify_clone/presentation/home/widgets/trending_text.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Text(
                  "Movie Zone",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
              ),
              TrendingText(title: "Trending Movies"),
              TrendingMovies(),
              SizedBox(height: 20),
              TrendingText(title: "Now Playing"),
              SizedBox(height: 10),
              NowPlayingMovies(),
              SizedBox(height: 20),
              TrendingText(title: "Popular Tv"),
              SizedBox(height: 10),
              PopularTvShows(),
            ],
          ),
        ),
      ),
    );
  }
}
