import 'package:dartz/dartz.dart';
import 'package:spotify_clone/common/helper/mapper/tv_content_mapper.dart';
import 'package:spotify_clone/data/tv/data_sources/tv_content_service.dart';
import 'package:spotify_clone/data/tv/models/tv_content.dart';
import 'package:spotify_clone/domain/tv/repositories/tv_content.dart';
import 'package:spotify_clone/service_locator.dart';

class TvContentRepositoryImpl extends TvContentRepository {
  @override
  Future<Either> getPopularTvContent() async {
    var returnedData = await sl<TvContentService>().getPopularTv();
    return returnedData.fold((error) => Left(error), (data) {
      var movies = List.from(data["content"])
          .map(
            (item) => TvContentMapper.toEntity(TvContentModel.fromJson(item)),
          )
          .toList();
      return Right(movies);
    });
  }
}
