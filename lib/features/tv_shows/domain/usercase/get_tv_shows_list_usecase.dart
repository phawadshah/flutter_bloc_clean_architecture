import 'package:dartz/dartz.dart';
import 'package:sgm_block/core/data/error/failure.dart';
import 'package:sgm_block/core/domain/entities/media_list.dart';
import 'package:sgm_block/features/tv_shows/domain/repository/tv_shows_repository.dart';

class GetTvShowsListUsecase {
  final TvShowsRepository _tvShowsRepository;

  GetTvShowsListUsecase({required TvShowsRepository tvShowsRepository})
      : _tvShowsRepository = tvShowsRepository;
  Future<Either<Failure, MediaList>> call(
    String category, {
    int page = 1,
  }) async {
    return await _tvShowsRepository.getTvShowsList(category, page);
  }
}
