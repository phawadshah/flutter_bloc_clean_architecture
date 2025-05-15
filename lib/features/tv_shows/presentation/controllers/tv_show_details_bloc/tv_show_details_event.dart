import 'package:equatable/equatable.dart';

abstract class TvShowDetailsEvent extends Equatable {
  const TvShowDetailsEvent();
}

class GetTvShowDetailsEvent extends TvShowDetailsEvent {
  final int tvShowId;
  const GetTvShowDetailsEvent(this.tvShowId);
  @override
  List<Object?> get props => [tvShowId];
}

class GetTvShowEpisodesEvent extends TvShowDetailsEvent {
  final int tvShowId;
  final int seasonNumber;
  const GetTvShowEpisodesEvent(this.tvShowId, this.seasonNumber);
  @override
  List<Object?> get props => [tvShowId, seasonNumber];
}

class ChangeSeasonEvent extends TvShowDetailsEvent {
  final int seasonNumber;
  const ChangeSeasonEvent(this.seasonNumber);

  @override
  List<Object?> get props => [seasonNumber];
}
