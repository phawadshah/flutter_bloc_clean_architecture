import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sgm_block/features/movies/domain/usecases/get_movies_list_usecase.dart';
import 'package:sgm_block/features/movies/presentation/controllers/movies_list_bloc/movies_list_event.dart';
import 'package:sgm_block/features/movies/presentation/controllers/movies_list_bloc/movies_list_state.dart';
import 'package:sgm_block/utils/enums.dart';

class MoviesListBloc extends Bloc<MoviesListEvent, MoviesListState> {
  final GetMoviesListUsecase _getMoviesListUsecase;

  MoviesListBloc({
    required GetMoviesListUsecase getMoviesListUsecase,
  })  : _getMoviesListUsecase = getMoviesListUsecase,
        super(const MoviesListState()) {
    on<GetMoviesListEvent>(_getMoviesList);
    on<LoadMoreMoviesListEvent>(_loadMoreMovies);
  }

  Future _getMoviesList(
    GetMoviesListEvent event,
    Emitter<MoviesListState> emit,
  ) async {
    final errorOrMovies = await _getMoviesListUsecase(event.category);
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

  Future _loadMoreMovies(
    LoadMoreMoviesListEvent event,
    Emitter<MoviesListState> emit,
  ) async {
    if (state.hasReachedMax || state.isLoadingMore) return;
    emit(state.copyWith(isLoadingMore: true));
    final errorOrMovies =
        await _getMoviesListUsecase(event.category, page: event.page);
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
