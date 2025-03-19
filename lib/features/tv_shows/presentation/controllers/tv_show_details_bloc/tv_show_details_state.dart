import 'package:equatable/equatable.dart';
import 'package:sgm_block/core/domain/entities/media_details.dart';
import 'package:sgm_block/utils/enums.dart';

class TvShowDetailsState extends Equatable {
  final String message;
  final MediaDetails? mediaDetails;
  final RequestStatus status;

  const TvShowDetailsState({
    this.message = '',
    this.mediaDetails,
    this.status = RequestStatus.loading,
  });

  TvShowDetailsState copyWith({
    String? message,
    MediaDetails? mediaDetails,
    RequestStatus? status,
  }) {
    return TvShowDetailsState(
      message: message ?? this.message,
      mediaDetails: mediaDetails ?? this.mediaDetails,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [message, mediaDetails, status];
}
