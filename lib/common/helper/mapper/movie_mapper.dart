import 'package:spotify_clone/data/movie/models/movie.dart';
import 'package:spotify_clone/domain/movie/entities/movie.dart';

class MovieMapper {
  static MovieEntity toEntity(MovieModel model) {
    return MovieEntity(
      adult: model.adult,
      backdropPath: model.backdropPath,
      id: model.id,
      title: model.title,
      originalTitle: model.originalTitle,
      overview: model.overview,
      posterPath: model.posterPath,
      mediaType: model.mediaType,
      originalLanguage: model.originalLanguage,
      genreIds: model.genreIds,
      popularity: model.popularity,
      releaseDate: model.releaseDate,
      video: model.video,
      voteAverage: model.voteAverage,
      voteCount: model.voteCount,
    );
  }
}
