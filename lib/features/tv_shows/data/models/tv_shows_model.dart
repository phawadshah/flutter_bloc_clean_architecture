import 'package:sgm_block/features/tv_shows/domain/enitites/tv_show.dart';
import 'package:sgm_block/utils/helper.dart';

class TvShowModel extends TvShow {
  const TvShowModel({
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

  factory TvShowModel.fromJson(Map<String, dynamic> json) {
    return TvShowModel(
      id: json["id"],
      img: getPosterUrl(json["poster_path"]),
      title: json["name"],
      overview: json["overview"],
      voteCount: json["vote_count"],
      voteAverage: json["vote_average"],
      releaseDate: json["first_air_date"],
      backdropUrl: getBackdropUrl(json["backdrop_path"]),
      isMovie: false,
    );
  }

  //
}
