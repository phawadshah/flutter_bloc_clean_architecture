import 'package:sgm_block/features/tv_shows/domain/enitites/tv_show_season.dart';

class TvShowSeasonModel extends TvShowSeason {
  const TvShowSeasonModel(
      {required super.id,
      required super.seasonNumber,
      required super.episodeCount});

  factory TvShowSeasonModel.fromJson(Map<String, dynamic> json) {
    return TvShowSeasonModel(
      id: json['id'],
      seasonNumber: (json['season_number'] as int) + 1,
      episodeCount: json['episode_count'],
    );
  }
}
