import 'package:dartz/dartz.dart';
import 'package:sgm_block/core/data/error/failure.dart';
import 'package:sgm_block/core/domain/entities/media.dart';
import 'package:sgm_block/core/domain/entities/media_details.dart';
import 'package:sgm_block/core/domain/entities/media_list.dart';

abstract class MoviesRepository {
  Future<Either<Failure, List<List<Media>>>> getMovies();
  Future<Either<Failure, MediaDetails>> getMovieDetails(int id);
  Future<Either<Failure, MediaList>> getMoviesList(String category, int page);
}
