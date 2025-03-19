import 'package:dartz/dartz.dart';
import 'package:sgm_block/core/data/error/failure.dart';
import 'package:sgm_block/core/domain/entities/media_list.dart';
import 'package:sgm_block/features/movies/domain/repository/movies_repository.dart';

class GetMoviesListUsecase {
  final MoviesRepository _moviesRepository;

  GetMoviesListUsecase({required MoviesRepository moviesRepository})
      : _moviesRepository = moviesRepository;

  Future<Either<Failure, MediaList>> call(
    String category, {
    int page = 1,
  }) async {
    return await _moviesRepository.getMoviesList(category, page);
  }
}
