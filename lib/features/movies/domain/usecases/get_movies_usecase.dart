import 'package:dartz/dartz.dart';
import 'package:sgm_block/core/data/error/failure.dart';
import 'package:sgm_block/core/domain/entities/media.dart';
import 'package:sgm_block/core/domain/usecases/base_usecase.dart';
import 'package:sgm_block/features/movies/domain/repository/movies_repository.dart';
import 'package:sgm_block/features/movies/domain/entities/movie.dart';

class GetMoviesUsecase extends BaseUseCase<List<List<Media>>, dynamic> {
  final MoviesRepository _movieRepository;
  GetMoviesUsecase({
    required MoviesRepository movieRepository,
  }) : _movieRepository = movieRepository;

  @override
  Future<Either<Failure, List<List<Media>>>> call(p) {
    return _movieRepository.getMovies();
  }
}
