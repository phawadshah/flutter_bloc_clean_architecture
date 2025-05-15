import 'package:equatable/equatable.dart';

class TvShowSeason extends Equatable {
  final int id;
  final int seasonNumber;
  final int episodeCount;

  const TvShowSeason(
      {required this.id,
      required this.seasonNumber,
      required this.episodeCount});

  @override
  List<Object?> get props => [id, seasonNumber, episodeCount];
}
