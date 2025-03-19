import 'package:equatable/equatable.dart';
import 'package:sgm_block/core/domain/entities/media.dart';
import 'package:sgm_block/features/movies/domain/entities/movie.dart';
import 'package:sgm_block/features/tv_shows/domain/enitites/tv_show.dart';
import 'package:sgm_block/utils/enums.dart';

class MoviesState extends Equatable {
  final String message;
  final List<List<Media>> movies;
  final RequestStatus status;
  const MoviesState({
    this.message = '',
    this.movies = const [],
    this.status = RequestStatus.loading,
  });

  MoviesState copyWith({
    String? message,
    List<List<Media>>? movies,
    List<List<TvShow>>? tvShows,
    RequestStatus? status,
  }) {
    return MoviesState(
      message: message ?? this.message,
      movies: movies ?? this.movies,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [message, movies, status];
}
