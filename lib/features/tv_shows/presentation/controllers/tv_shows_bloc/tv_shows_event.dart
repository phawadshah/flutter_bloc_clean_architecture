import 'package:equatable/equatable.dart';

abstract class TvShowsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetTvShowsEvent extends TvShowsEvent {}
