import 'package:sgm_block/core/domain/entities/media_list.dart';

class MoviesList extends MediaList {
  const MoviesList({
    required super.page,
    required super.totalPages,
    required super.totalResults,
    required super.mediaList,
  });
}
