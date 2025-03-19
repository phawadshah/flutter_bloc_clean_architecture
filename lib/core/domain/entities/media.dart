import 'package:equatable/equatable.dart';

class Media extends Equatable {
  final int id;
  final String img;
  final String title;
  final String overview;
  final int voteCount;
  final num voteAverage;
  final String releaseDate;
  final String? backdropUrl;
  final bool isMovie;

  const Media({
    required this.id,
    required this.img,
    required this.title,
    required this.overview,
    required this.voteCount,
    required this.voteAverage,
    required this.releaseDate,
    required this.backdropUrl,
    required this.isMovie,
  });

  @override
  List<Object?> get props => [
        id,
        img,
        title,
        overview,
        voteCount,
        voteAverage,
        releaseDate,
        backdropUrl,
        isMovie
      ];
}
