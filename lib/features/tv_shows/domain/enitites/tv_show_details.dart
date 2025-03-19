import 'package:sgm_block/core/domain/entities/media_details.dart';

class TvShowDetails extends MediaDetails {
  const TvShowDetails({
    required super.id,
    required super.img,
    required super.title,
    required super.overview,
    required super.voteCount,
    required super.voteAverage,
    super.releaseDate,
    required super.backdropUrl,
  });
}
