import 'package:sgm_block/core/domain/entities/media.dart';

class TvShow extends Media {
  const TvShow({
    required super.id,
    required super.img,
    required super.title,
    required super.overview,
    required super.voteCount,
    required super.voteAverage,
    required super.releaseDate,
    required super.backdropUrl,
    required super.isMovie,
  });
}
