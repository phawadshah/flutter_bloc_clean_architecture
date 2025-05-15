import 'package:sgm_block/features/tv_shows/domain/enitites/tv_show_episode.dart';
import 'package:sgm_block/utils/helper.dart';

class TvShowEpisodeModel extends TvShowEpisode {
  const TvShowEpisodeModel({
    required super.airDate,
    required super.id,
    required super.seasonNumber,
    required super.episodeNumer,
    required super.name,
    required super.overview,
    required super.stillPath,
  });

  factory TvShowEpisodeModel.fromJson(Map<String, dynamic> json) {
    return TvShowEpisodeModel(
      airDate: json['air_date'] as String?,
      id: json['id'],
      seasonNumber: (json['season_number'] as int) + 1,
      episodeNumer: json['episode_number'],
      name: json['name'],
      overview: json['overview'],
      stillPath: getStuillPathUrl(json),
    );
  }
}
