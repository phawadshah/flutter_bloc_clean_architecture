import 'package:equatable/equatable.dart';
import 'package:sgm_block/core/domain/entities/media_list.dart';
import 'package:sgm_block/utils/enums.dart';

class TvShowsListState extends Equatable {
  final String message;
  final MediaList? mediaList;
  final RequestStatus status;
  final bool hasReachedMax;
  final bool isLoadingMore;

  const TvShowsListState({
    this.message = '',
    this.mediaList,
    this.status = RequestStatus.loading,
    this.hasReachedMax = false,
    this.isLoadingMore = false,
  });

  TvShowsListState copyWith({
    String? message,
    MediaList? mediaList,
    RequestStatus? status,
    bool? hasReachedMax,
    bool? isLoadingMore,
  }) {
    return TvShowsListState(
      message: message ?? this.message,
      mediaList: mediaList ?? this.mediaList,
      status: status ?? this.status,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }

  @override
  List<Object?> get props =>
      [message, mediaList, status, hasReachedMax, isLoadingMore];
}
