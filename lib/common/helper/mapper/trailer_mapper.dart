import 'package:spotify_clone/data/movie/models/trailer.dart';
import 'package:spotify_clone/domain/movie/entities/trailer.dart';

class TrailerMapper {
  static TrailerEntity toEntity(TrailerModel model) {
    return TrailerEntity(
      iso6391: model.iso6391,
      iso31661: model.iso31661,
      name: model.name,
      key: model.key,
      site: model.site,
      size: model.size,
      type: model.type,
      official: model.official,
      publishedAt: model.publishedAt,
      id: model.id,
    );
  }
}
