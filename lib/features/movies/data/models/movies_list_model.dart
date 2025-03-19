import 'package:sgm_block/core/domain/entities/media.dart';
import 'package:sgm_block/features/movies/data/models/movie_model.dart';
import 'package:sgm_block/features/movies/domain/entities/movies_list.dart';

class MoviesListModel extends MoviesList {
  const MoviesListModel({
    required super.page,
    required super.totalPages,
    required super.totalResults,
    required super.mediaList,
  });

  factory MoviesListModel.fromJson(Map<String, dynamic> json) {
    return MoviesListModel(
      page: json['page'],
      totalPages: json['total_pages'],
      totalResults: json['total_results'],
      mediaList: (json['results'] as List)
          .map((media) => MovieModel.fromJson(media))
          .toList(),
    );
  }
}
