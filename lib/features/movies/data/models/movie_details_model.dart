import 'dart:developer';

import 'package:sgm_block/features/movies/data/models/movie_cast_model.dart';
import 'package:sgm_block/features/movies/data/models/movie_model.dart';
import 'package:sgm_block/features/movies/data/models/movie_review_model.dart';
import 'package:sgm_block/features/movies/domain/entities/movie_details.dart';
import 'package:sgm_block/utils/helper.dart';

class MovieDetailsModel extends MovieDetails {
  const MovieDetailsModel({
    required super.id,
    required super.img,
    required super.title,
    required super.overview,
    required super.voteCount,
    required super.voteAverage,
    required super.releaseDate,
    required super.backdropUrl,
    required super.trailerUrl,
    super.cast,
    super.similar,
    super.reviews,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailsModel(
      id: json["id"],
      img: getPosterUrl(json["poster_path"]),
      title: json["title"],
      overview: json["overview"],
      releaseDate: json["release_date"],
      voteAverage: json["vote_average"],
      voteCount: json["vote_count"],
      backdropUrl: getBackdropUrl(json["backdrop_path"]),
      trailerUrl: getTrailerUrl(json),
      cast: ((json["credits"]["cast"] as List)
          .map((cast) => MovieCastModel.fromJson(cast))).take(20).toList(),
      similar: (json['similar']['results'] as List)
          .map((movie) => MovieModel.fromJson(movie))
          .toList(),
      reviews: (json['reviews']['results'] as List)
          .map((review) => MovieReviewModel.fromJson(review))
          .toList(),
    );
  }
}
