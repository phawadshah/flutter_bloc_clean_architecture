import 'package:dartz/dartz.dart';
import 'package:sgm_block/core/data/error/failure.dart';
import 'package:sgm_block/core/domain/entities/media_details.dart';
import 'package:sgm_block/core/domain/usecases/base_usecase.dart';
import 'package:sgm_block/features/tv_shows/domain/repository/tv_shows_repository.dart';

class GetTvShowDetailsUsecase extends BaseUseCase<MediaDetails, int> {
  final TvShowsRepository _tvShowsRepository;

  GetTvShowDetailsUsecase({required TvShowsRepository tvShowsRepository})
      : _tvShowsRepository = tvShowsRepository;

  @override
  Future<Either<Failure, MediaDetails>> call(int p) async {
    return await _tvShowsRepository.getTvShowDetails(p);
  }
}
