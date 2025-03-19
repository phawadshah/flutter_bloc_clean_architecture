import 'package:equatable/equatable.dart';
import 'package:sgm_block/core/domain/entities/media_details.dart';
import 'package:sgm_block/utils/enums.dart';

class MovieDetailsState extends Equatable {
  final RequestStatus status;
  final String message;
  final MediaDetails? movieDetails;

  const MovieDetailsState({
    this.status = RequestStatus.loading,
    this.message = '',
    this.movieDetails,
  });

  MovieDetailsState copyWith({
    RequestStatus? status,
    RequestStatus? recommendedMoviesStatus,
    String? message,
    MediaDetails? movieDetails,
  }) {
    return MovieDetailsState(
      status: status ?? this.status,
      message: message ?? this.message,
      movieDetails: movieDetails ?? this.movieDetails,
    );
  }

  @override
  List<Object?> get props => [status, message, movieDetails];
}
