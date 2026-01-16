import 'package:spotify_clone/data/tv/models/tv_content.dart';
import 'package:spotify_clone/domain/tv/entities/tv_content.dart';

class TvContentMapper {
  static TvContentEntity toEntity(TvContentModel model) {
    return TvContentEntity(
      adult: model.adult,
      backdropPath: model.backdropPath,
      id: model.id,
      originCountry: model.originCountry,
      originalName: model.originalName,
      overview: model.overview,
      posterPath: model.posterPath,
      firstAirDate: model.firstAirDate,
      name: model.name,
      originalLanguage: model.originalLanguage,
      genreIds: model.genreIds,
      popularity: model.popularity,
      voteAverage: model.voteAverage,
      voteCount: model.voteCount,
    );
  }
}
