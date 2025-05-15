import 'package:dartz/dartz.dart';
import 'package:sgm_block/core/data/error/failure.dart';
import 'package:sgm_block/features/tv_shows/domain/enitites/tv_show_episode.dart';
import 'package:sgm_block/features/tv_shows/domain/repository/tv_shows_repository.dart';

class GetTvShowEpisodesUsecase {
  final TvShowsRepository _tvShowsRepository;

  GetTvShowEpisodesUsecase({
    required TvShowsRepository tvShowsRepository,
  }) : _tvShowsRepository = tvShowsRepository;

  Future<Either<Failure, List<TvShowEpisode>>> call(
    int tvShowId, {
    int season = 1,
  }) async {
    return await _tvShowsRepository.getTvShowEpisodes(tvShowId, season);
  }
}
