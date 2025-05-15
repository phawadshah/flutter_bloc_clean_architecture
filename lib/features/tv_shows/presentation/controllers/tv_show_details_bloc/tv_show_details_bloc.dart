import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sgm_block/features/tv_shows/domain/usercase/get_tv_show_details_usecase.dart';
import 'package:sgm_block/features/tv_shows/domain/usercase/get_tv_show_episodes_usecase.dart';
import 'package:sgm_block/features/tv_shows/presentation/controllers/tv_show_details_bloc/tv_show_details_event.dart';
import 'package:sgm_block/features/tv_shows/presentation/controllers/tv_show_details_bloc/tv_show_details_state.dart';
import 'package:sgm_block/utils/enums.dart';

class TvShowDetailsBloc extends Bloc<TvShowDetailsEvent, TvShowDetailsState> {
  final GetTvShowDetailsUsecase _getTvShowDetailsUsecase;
  final GetTvShowEpisodesUsecase _getTvShowEpisodesUsecase;
  TvShowDetailsBloc({
    required GetTvShowDetailsUsecase getTvShowDetailsUsecase,
    required GetTvShowEpisodesUsecase getTvShowEpisodesUsecase,
  })  : _getTvShowDetailsUsecase = getTvShowDetailsUsecase,
        _getTvShowEpisodesUsecase = getTvShowEpisodesUsecase,
        super(const TvShowDetailsState()) {
    on<GetTvShowDetailsEvent>(_getTvShowDetails);
    on<GetTvShowEpisodesEvent>(_getTvShowEpisodes);
    on<ChangeSeasonEvent>(_changeSeason);
  }

  Future _getTvShowDetails(
    GetTvShowDetailsEvent event,
    Emitter<TvShowDetailsState> emit,
  ) async {
    if (state.status == RequestStatus.error) {
      emit(state.copyWith(status: RequestStatus.retrying));
    } else {
      emit(state.copyWith(status: RequestStatus.loading));
    }
    var errorOrResults = await _getTvShowDetailsUsecase(event.tvShowId);
    errorOrResults.fold((error) {
      emit(
        state.copyWith(
          status: RequestStatus.error,
          message: error.message,
        ),
      );
    }, (tvShowDetails) {
      emit(
        state.copyWith(
          status: RequestStatus.loaded,
          mediaDetails: tvShowDetails,
        ),
      );
      add(GetTvShowEpisodesEvent(event.tvShowId, 1));
    });
  }

  Future _getTvShowEpisodes(
    GetTvShowEpisodesEvent event,
    Emitter<TvShowDetailsState> emit,
  ) async {
    if (state.episodesStatus == RequestStatus.error) {
      emit(state.copyWith(episodesStatus: RequestStatus.retrying));
    } else {
      emit(state.copyWith(episodesStatus: RequestStatus.loading));
    }
    var errorOrResults = await _getTvShowEpisodesUsecase(event.tvShowId,
        season: event.seasonNumber);
    errorOrResults.fold((error) {
      emit(
        state.copyWith(
          episodesStatus: RequestStatus.error,
          episodesMessage: error.message,
        ),
      );
    }, (tvShowEpisodes) {
      emit(
        state.copyWith(
          episodesStatus: RequestStatus.loaded,
          tvShowEpisodes: tvShowEpisodes,
          selectedSeason: event.seasonNumber,
        ),
      );
    });
  }

  void _changeSeason(
    ChangeSeasonEvent event,
    Emitter<TvShowDetailsState> emit,
  ) async {
    emit(state.copyWith(selectedSeason: event.seasonNumber));
    add(GetTvShowEpisodesEvent(state.mediaDetails!.id, event.seasonNumber));
  }
}
