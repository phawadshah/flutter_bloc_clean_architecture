import 'package:sgm_block/core/domain/entities/media.dart';

class Movie extends Media {
  const Movie({
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
