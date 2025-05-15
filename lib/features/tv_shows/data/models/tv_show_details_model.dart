import 'package:sgm_block/core/data/models/cast_model.dart';
import 'package:sgm_block/core/data/models/review_model.dart';
import 'package:sgm_block/features/tv_shows/data/models/tv_show_season_model.dart';

import 'package:sgm_block/features/tv_shows/data/models/tv_shows_model.dart';
import 'package:sgm_block/features/tv_shows/domain/enitites/tv_show_details.dart';
import 'package:sgm_block/utils/helper.dart';

class TvShowDetailsModel extends TvShowDetails {
  const TvShowDetailsModel({
    required super.id,
    required super.img,
    required super.title,
    required super.overview,
    required super.voteCount,
    required super.voteAverage,
    required super.backdropUrl,
    required super.trailerUrl,
    super.cast = const [],
    super.similar = const [],
    super.reviews = const [],
    required super.numberOfSeasons,
    required super.numberOfEpisodes,
    super.seasons = const [],
  });

  factory TvShowDetailsModel.fromJson(Map<String, dynamic> json) {
    return TvShowDetailsModel(
      id: json["id"],
      img: getPosterUrl(json["poster_path"]),
      title: json["original_name"],
      overview: json["overview"],
      voteAverage: json["vote_average"],
      voteCount: json["vote_count"],
      backdropUrl: getBackdropUrl(json["backdrop_path"]),
      trailerUrl: getTrailerUrl(json),
      cast: ((json["credits"]["cast"] as List)
          .map((cast) => CastModel.fromJson(cast))).take(20).toList(),
      similar: ((json["similar"]['results'] as List)
          .map((cast) => TvShowModel.fromJson(cast))).toList(),
      reviews: ((json["reviews"]['results'] as List)
          .map((cast) => ReviewModel.fromJson(cast))).toList(),
      numberOfSeasons: json["number_of_seasons"],
      numberOfEpisodes: json["number_of_episodes"],
      seasons: ((json["seasons"] as List)
          .map((cast) => TvShowSeasonModel.fromJson(cast))).toList(),
    );
  }
}
