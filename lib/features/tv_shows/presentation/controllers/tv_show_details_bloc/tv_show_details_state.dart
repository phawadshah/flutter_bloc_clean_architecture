import 'package:equatable/equatable.dart';
import 'package:sgm_block/core/domain/entities/media_details.dart';
import 'package:sgm_block/features/tv_shows/domain/enitites/tv_show_episode.dart';
import 'package:sgm_block/utils/enums.dart';

class TvShowDetailsState extends Equatable {
  final String message;
  final MediaDetails? mediaDetails;
  final RequestStatus status;

  final String episodesMessage;
  final RequestStatus episodesStatus;
  final List<TvShowEpisode> tvShowEpisodes;
  final int selectedSeason;

  const TvShowDetailsState({
    this.message = '',
    this.mediaDetails,
    this.status = RequestStatus.loading,
    this.episodesMessage = '',
    this.episodesStatus = RequestStatus.loading,
    this.tvShowEpisodes = const [],
    this.selectedSeason = 1,
  });

  TvShowDetailsState copyWith({
    String? message,
    MediaDetails? mediaDetails,
    RequestStatus? status,
    String? episodesMessage,
    List<TvShowEpisode>? tvShowEpisodes,
    RequestStatus? episodesStatus,
    int? selectedSeason,
  }) {
    return TvShowDetailsState(
      message: message ?? this.message,
      mediaDetails: mediaDetails ?? this.mediaDetails,
      status: status ?? this.status,
      episodesMessage: episodesMessage ?? this.episodesMessage,
      tvShowEpisodes: tvShowEpisodes ?? this.tvShowEpisodes,
      episodesStatus: episodesStatus ?? this.episodesStatus,
      selectedSeason: selectedSeason ?? this.selectedSeason,
    );
  }

  @override
  List<Object?> get props => [
        message,
        mediaDetails,
        status,
        episodesMessage,
        tvShowEpisodes,
        episodesStatus,
        selectedSeason
      ];
}
