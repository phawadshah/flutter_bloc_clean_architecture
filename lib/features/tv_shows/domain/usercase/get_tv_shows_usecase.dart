import 'package:dartz/dartz.dart';
import 'package:sgm_block/core/data/error/failure.dart';
import 'package:sgm_block/core/domain/entities/media.dart';
import 'package:sgm_block/core/domain/usecases/base_usecase.dart';
import 'package:sgm_block/features/tv_shows/domain/enitites/tv_show.dart';
import 'package:sgm_block/features/tv_shows/domain/repository/tv_shows_repository.dart';

class GetTvShowsUsecase extends BaseUseCase<List<List<Media>>, dynamic> {
  final TvShowsRepository _tvShowsRepository;
  GetTvShowsUsecase({
    required TvShowsRepository tvShowsRepository,
  }) : _tvShowsRepository = tvShowsRepository;
  @override
  Future<Either<Failure, List<List<Media>>>> call(p) async {
    return await _tvShowsRepository.getTvShows();
  }
}
