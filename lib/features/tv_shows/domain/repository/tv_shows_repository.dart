import 'package:dartz/dartz.dart';
import 'package:sgm_block/core/data/error/failure.dart';
import 'package:sgm_block/core/domain/entities/media.dart';
import 'package:sgm_block/features/tv_shows/domain/enitites/tv_show.dart';

abstract class TvShowsRepository {
  Future<Either<Failure, List<List<Media>>>> getTvShows();
}
