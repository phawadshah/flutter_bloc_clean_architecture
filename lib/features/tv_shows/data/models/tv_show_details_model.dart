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
    );
  }
}
