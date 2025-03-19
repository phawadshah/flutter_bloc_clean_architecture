import 'package:sgm_block/features/tv_shows/data/models/tv_shows_model.dart';
import 'package:sgm_block/features/tv_shows/domain/enitites/tv_shows_list.dart';

class TvShowsListModel extends TvShowsList {
  const TvShowsListModel({
    required super.page,
    required super.totalPages,
    required super.totalResults,
    required super.mediaList,
  });

  factory TvShowsListModel.fromJson(Map<String, dynamic> json) {
    return TvShowsListModel(
      page: json['page'],
      totalPages: json['total_pages'],
      totalResults: json['total_results'],
      mediaList: (json['results'] as List)
          .map((e) => TvShowModel.fromJson(e))
          .toList(),
    );
  }
}
