import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sgm_block/features/tv_shows/domain/usercase/get_tv_shows_list_usecase.dart';
import 'package:sgm_block/features/tv_shows/presentation/controllers/tv_shows_bloc/tv_shows_event.dart';
import 'package:sgm_block/features/tv_shows/presentation/controllers/tv_shows_bloc/tv_shows_state.dart';
import 'package:sgm_block/features/tv_shows/presentation/controllers/tv_shows_list_bloc/tv_shows_list_event.dart';
import 'package:sgm_block/features/tv_shows/presentation/controllers/tv_shows_list_bloc/tv_shows_list_state.dart';
import 'package:sgm_block/utils/enums.dart';

class TvShowsListBloc extends Bloc<TvShowsListEvent, TvShowsListState> {
  final GetTvShowsListUsecase _getTvShowsListUsecase;
  TvShowsListBloc({
    required GetTvShowsListUsecase getTvShowsListUsecase,
  })  : _getTvShowsListUsecase = getTvShowsListUsecase,
        super(const TvShowsListState()) {
    on<GetTvShowsListEvent>(_getTvShowsList);
    on<LoadMoreTvShowsListEvent>(_loadMoreTvShows);
  }

  Future _getTvShowsList(
    GetTvShowsListEvent event,
    Emitter<TvShowsListState> emit,
  ) async {
    final errorOrMovies = await _getTvShowsListUsecase(event.category);
    errorOrMovies.fold((error) {
      log(error.message.toString());
      emit(
        state.copyWith(
          status: RequestStatus.error,
          message: error.message,
        ),
      );
    }, (moviesList) {
      emit(
        state.copyWith(
          mediaList: moviesList,
          status: RequestStatus.loaded,
          hasReachedMax: moviesList.page == moviesList.totalPages,
        ),
      );
    });
  }

  Future _loadMoreTvShows(
    LoadMoreTvShowsListEvent event,
    Emitter<TvShowsListState> emit,
  ) async {
    if (state.hasReachedMax || state.isLoadingMore) return;
    emit(state.copyWith(isLoadingMore: true));
    final errorOrMovies =
        await _getTvShowsListUsecase(event.category, page: event.page);
    errorOrMovies.fold((error) {
      emit(
        state.copyWith(
          status: RequestStatus.error,
          message: error.message,
          isLoadingMore: false,
        ),
      );
    }, (moviesList) {
      emit(
        state.copyWith(
          mediaList: moviesList.copyWith(
              mediaList: (state.mediaList!.mediaList) + moviesList.mediaList),
          status: RequestStatus.loaded,
          hasReachedMax: moviesList.page == moviesList.totalPages,
          isLoadingMore: false,
        ),
      );
    });
  }
}
