import 'package:equatable/equatable.dart';
import 'package:sgm_block/core/domain/entities/media.dart';

class MediaList extends Equatable {
  final int page;
  final int totalPages;
  final int totalResults;
  final List<Media> mediaList;

  const MediaList({
    required this.page,
    required this.totalPages,
    required this.totalResults,
    required this.mediaList,
  });

  MediaList copyWith({
    int? page,
    int? totalPages,
    int? totalResults,
    List<Media>? mediaList,
  }) {
    return MediaList(
      page: page ?? this.page,
      totalPages: totalPages ?? this.totalPages,
      totalResults: totalResults ?? this.totalResults,
      mediaList: mediaList ?? this.mediaList,
    );
  }

  @override
  List<Object?> get props => [page, totalPages, totalResults, mediaList];
}
