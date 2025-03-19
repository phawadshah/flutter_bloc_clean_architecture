import 'package:sgm_block/core/domain/entities/media_details.dart';

class MovieDetails extends MediaDetails {
  const MovieDetails({
    required super.id,
    required super.img,
    required super.title,
    required super.overview,
    required super.voteCount,
    required super.voteAverage,
    required super.releaseDate,
    required super.backdropUrl,
    required super.trailerUrl,
    super.cast = const [],
    super.similar = const [],
    super.reviews = const [],
  });
}
