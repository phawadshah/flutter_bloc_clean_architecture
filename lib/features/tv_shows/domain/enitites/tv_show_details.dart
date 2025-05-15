import 'package:sgm_block/core/domain/entities/media_details.dart';
import 'package:sgm_block/features/tv_shows/domain/enitites/tv_show_season.dart';

class TvShowDetails extends MediaDetails {
  final int numberOfSeasons;
  final int numberOfEpisodes;
  final List<TvShowSeason> seasons;
  const TvShowDetails({
    required super.id,
    required super.img,
    required super.title,
    required super.overview,
    required super.voteCount,
    required super.voteAverage,
    super.releaseDate,
    required super.backdropUrl,
    required super.trailerUrl,
    required super.cast,
    required super.similar,
    required super.reviews,
    required this.numberOfSeasons,
    required this.numberOfEpisodes,
    required this.seasons,
  });
}
