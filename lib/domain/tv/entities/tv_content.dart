import 'package:spotify_clone/core/configs/assets/app_images.dart';

class TvContentEntity {
  TvContentEntity({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originCountry,
    required this.originalLanguage,
    required this.originalName,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.firstAirDate,
    required this.name,
    required this.voteAverage,
    required this.voteCount,
  });

  final bool? adult;
  final String? backdropPath;
  final List<int> genreIds;
  final int? id;
  final List<String> originCountry;
  final String? originalLanguage;
  final String? originalName;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final DateTime? firstAirDate;
  final String? name;
  final double? voteAverage;
  final int? voteCount;

  factory TvContentEntity.fromJson(Map<String, dynamic> json) {
    return TvContentEntity(
      adult: json["adult"],
      backdropPath: json["backdrop_path"],
      genreIds: json["genre_ids"] == null
          ? []
          : List<int>.from(json["genre_ids"]!.map((x) => x)),
      id: json["id"],
      originCountry: json["origin_country"] == null
          ? []
          : List<String>.from(json["origin_country"]!.map((x) => x)),
      originalLanguage: json["original_language"],
      originalName: json["original_name"],
      overview: json["overview"],
      popularity: json["popularity"],
      posterPath: json["poster_path"],
      firstAirDate: DateTime.tryParse(json["first_air_date"] ?? ""),
      name: json["name"],
      voteAverage: double.tryParse(json["vote_average"].toString()),
      voteCount: json["vote_count"],
    );
  }

  String providePosterPath() {
    if (posterPath != null) {
      return AppImages.moviesImageBasePath + posterPath!;
    } else {
      return AppImages.defaultImage;
    }
  }
}
