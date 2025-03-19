import 'package:equatable/equatable.dart';

abstract class TvShowDetailsEvent extends Equatable {
  const TvShowDetailsEvent();
}

class GetTvShowDetailsEvent extends TvShowDetailsEvent {
  final int tvShowIdid;
  const GetTvShowDetailsEvent(this.tvShowIdid);
  @override
  List<Object?> get props => [tvShowIdid];
}
