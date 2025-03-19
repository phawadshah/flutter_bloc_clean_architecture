import 'package:equatable/equatable.dart';

abstract class MoviesListEvent extends Equatable {
  const MoviesListEvent();
}

class GetMoviesListEvent extends MoviesListEvent {
  final String category;
  const GetMoviesListEvent(this.category);
  @override
  List<Object?> get props => [category];
}

class LoadMoreMoviesListEvent extends MoviesListEvent {
  final String category;
  final int page;
  const LoadMoreMoviesListEvent(this.category, {required this.page});
  @override
  List<Object?> get props => [category];
}
