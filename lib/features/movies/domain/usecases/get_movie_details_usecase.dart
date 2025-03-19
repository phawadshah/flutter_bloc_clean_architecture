import 'package:dartz/dartz.dart';
import 'package:sgm_block/core/data/error/failure.dart';
import 'package:sgm_block/core/domain/entities/media_details.dart';
import 'package:sgm_block/core/domain/usecases/base_usecase.dart';
import 'package:sgm_block/features/movies/domain/repository/movies_repository.dart';

class GetMovieDetailsUseCase extends BaseUseCase<MediaDetails, int> {
  final MoviesRepository _moviesRepository;

  GetMovieDetailsUseCase({
    required MoviesRepository moviesRepository,
  }) : _moviesRepository = moviesRepository;

  @override
  Future<Either<Failure, MediaDetails>> call(int p) {
    return _moviesRepository.getMovieDetails(p);
  }
}
