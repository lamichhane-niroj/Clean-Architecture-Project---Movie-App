import 'package:flutter/material.dart';
import 'package:spotify_clone/presentation/watch/widgets/title_text.dart';

class MovieOverview extends StatelessWidget {
  const MovieOverview({super.key, required this.overview});

  final String overview;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleText(title: "Overview"),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(overview),
        ),
      ],
    );
  }
}
