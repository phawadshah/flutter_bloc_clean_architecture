import 'package:dartz/dartz.dart';
import 'package:sgm_block/core/data/error/failure.dart';
import 'package:sgm_block/core/domain/entities/media.dart';
import 'package:sgm_block/core/domain/entities/media_details.dart';
import 'package:sgm_block/core/domain/entities/media_list.dart';

abstract class TvShowsRepository {
  Future<Either<Failure, List<List<Media>>>> getTvShows();
  Future<Either<Failure, MediaDetails>> getTvShowDetails(int id);
  Future<Either<Failure, MediaList>> getTvShowsList(String category, int page);
}
