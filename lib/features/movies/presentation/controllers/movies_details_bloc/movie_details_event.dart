import 'package:equatable/equatable.dart';

abstract class MovieDetailsEvent extends Equatable {
  const MovieDetailsEvent();
}

class GetMovieDetailsEvent extends MovieDetailsEvent {
  final int movieId;
  const GetMovieDetailsEvent(this.movieId);
  @override
  List<Object?> get props => [movieId];
}
