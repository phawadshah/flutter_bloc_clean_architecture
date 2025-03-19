import 'package:equatable/equatable.dart';

abstract class TvShowsListEvent extends Equatable {
  const TvShowsListEvent();
}

class GetTvShowsListEvent extends TvShowsListEvent {
  final String category;
  const GetTvShowsListEvent(this.category);
  @override
  List<Object?> get props => [category];
}

class LoadMoreTvShowsListEvent extends TvShowsListEvent {
  final String category;
  final int page;
  const LoadMoreTvShowsListEvent(this.category, {required this.page});
  @override
  List<Object?> get props => [category];
}
