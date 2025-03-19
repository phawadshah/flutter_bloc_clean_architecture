import 'package:sgm_block/features/movies/domain/entities/movie.dart';
import 'package:sgm_block/utils/helper.dart';

class MovieModel extends Movie {
  const MovieModel({
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

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        id: json["id"],
        img: getPosterUrl(json["poster_path"]),
        title: json["title"],
        overview: json["overview"],
        releaseDate: json["release_date"],
        voteAverage: json["vote_average"],
        voteCount: json["vote_count"],
        backdropUrl: getBackdropUrl(json["backdrop_path"]),
        isMovie: true,
      );
}
