import 'package:dartz/dartz.dart';

abstract class TvContentRepository{
  Future<Either> getPopularTvContent(); 
}