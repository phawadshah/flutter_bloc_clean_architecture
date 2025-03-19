import 'package:equatable/equatable.dart';
import 'package:sgm_block/core/domain/entities/media.dart';
import 'package:sgm_block/features/tv_shows/domain/enitites/tv_show.dart';
import 'package:sgm_block/utils/enums.dart';

class TvShowsState extends Equatable {
  final String message;
  final RequestStatus status;
  final List<List<Media>> tvShows;

  const TvShowsState({
    this.message = '',
    this.status = RequestStatus.loading,
    this.tvShows = const [],
  });

  TvShowsState copyWith({
    String? message,
    RequestStatus? status,
    List<List<Media>>? tvShows,
  }) {
    return TvShowsState(
      message: message ?? this.message,
      status: status ?? this.status,
      tvShows: tvShows ?? this.tvShows,
    );
  }

  @override
  List<Object?> get props => [message, status, tvShows];
}
