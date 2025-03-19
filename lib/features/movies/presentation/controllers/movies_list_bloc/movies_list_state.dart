import 'package:equatable/equatable.dart';
import 'package:sgm_block/core/domain/entities/media_list.dart';
import 'package:sgm_block/utils/enums.dart';

class MoviesListState extends Equatable {
  final MediaList? mediaList;
  final RequestStatus status;
  final String message;
  final bool hasReachedMax;
  final bool isLoadingMore;
  const MoviesListState({
    this.mediaList,
    this.status = RequestStatus.loading,
    this.message = '',
    this.hasReachedMax = false,
    this.isLoadingMore = false,
  });

  MoviesListState copyWith({
    MediaList? mediaList,
    RequestStatus? status,
    String? message,
    bool? hasReachedMax,
    bool? isLoadingMore,
  }) {
    return MoviesListState(
      mediaList: mediaList ?? this.mediaList,
      status: status ?? this.status,
      message: message ?? this.message,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }

  @override
  List<Object?> get props =>
      [mediaList, status, message, hasReachedMax, isLoadingMore];
}
