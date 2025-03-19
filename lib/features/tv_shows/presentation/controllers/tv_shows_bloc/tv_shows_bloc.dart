import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sgm_block/features/tv_shows/domain/usercase/get_tv_shows_usecase.dart';
import 'package:sgm_block/features/tv_shows/presentation/controllers/tv_shows_bloc/tv_shows_event.dart';
import 'package:sgm_block/features/tv_shows/presentation/controllers/tv_shows_bloc/tv_shows_state.dart';
import 'package:sgm_block/utils/enums.dart';

class TvShowsBloc extends Bloc<TvShowsEvent, TvShowsState> {
  final GetTvShowsUsecase _getTvShowsUseCase;

  TvShowsBloc({required GetTvShowsUsecase getTvShowsUseCase})
      : _getTvShowsUseCase = getTvShowsUseCase,
        super(const TvShowsState()) {
    on<GetTvShowsEvent>(_getTvShows);
  }

  Future _getTvShows(
    GetTvShowsEvent event,
    Emitter<TvShowsState> emit,
  ) async {
    final result = await _getTvShowsUseCase(const []);
    result.fold(
      (error) => emit(
        state.copyWith(
          status: RequestStatus.error,
          message: error.message,
        ),
      ),
      (tvShows) => emit(
        state.copyWith(
          tvShows: tvShows,
          status: RequestStatus.loaded,
        ),
      ),
    );
  }
}
