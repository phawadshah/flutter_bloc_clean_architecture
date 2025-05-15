import 'package:equatable/equatable.dart';

class TvShowEpisode extends Equatable {
  final String? airDate;
  final int id;
  final int seasonNumber;
  final int episodeNumer;
  final String name;
  final String overview;
  final String stillPath;

  const TvShowEpisode({
    required this.airDate,
    required this.id,
    required this.seasonNumber,
    required this.episodeNumer,
    required this.name,
    required this.overview,
    required this.stillPath,
  });

  @override
  List<Object?> get props =>
      [airDate, id, seasonNumber, episodeNumer, name, overview, stillPath];
}
