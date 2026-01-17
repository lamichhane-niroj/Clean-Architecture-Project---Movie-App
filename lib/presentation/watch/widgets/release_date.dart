import 'package:flutter/material.dart';

class ReleaseDate extends StatelessWidget {
  const ReleaseDate({super.key, required this.releaseDate});

  final DateTime releaseDate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Icon(Icons.calendar_month),
          SizedBox(width: 10),
          Text(releaseDate.toIso8601String().split("T")[0])
        ],
      ),
    );
  }
}