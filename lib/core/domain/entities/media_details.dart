import 'package:equatable/equatable.dart';
import 'package:sgm_block/core/domain/entities/cast.dart';
import 'package:sgm_block/core/domain/entities/media.dart';
import 'package:sgm_block/core/domain/entities/review.dart';

class MediaDetails extends Equatable {
  final int id;
  final String img;
  final String title;
  final String overview;
  final int voteCount;
  final num voteAverage;
  final String? releaseDate;
  final String? backdropUrl;
  final String? trailerUrl;
  final List<Cast> cast;
  final List<Media> similar;
  final List<Review> reviews;

  const MediaDetails({
    required this.id,
    required this.img,
    required this.title,
    required this.overview,
    required this.voteCount,
    required this.voteAverage,
    this.releaseDate,
    required this.backdropUrl,
    this.trailerUrl,
    this.cast = const [],
    this.similar = const [],
    this.reviews = const [],
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
        trailerUrl,
        cast,
        similar,
        reviews,
      ];
}
