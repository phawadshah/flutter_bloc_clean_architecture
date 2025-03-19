import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sgm_block/features/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:sgm_block/features/movies/presentation/controllers/movies_details/movie_details_event.dart';
import 'package:sgm_block/features/movies/presentation/controllers/movies_details/movie_details_state.dart';
import 'package:sgm_block/utils/enums.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDetailsUseCase _getMovieDetailsUseCase;

  MovieDetailsBloc({
    required GetMovieDetailsUseCase getMovieDetailsUseCase,
  })  : _getMovieDetailsUseCase = getMovieDetailsUseCase,
        super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(getMovieDetails);
  }

  Future getMovieDetails(
    GetMovieDetailsEvent event,
    Emitter<MovieDetailsState> emit,
  ) async {
    final result = await _getMovieDetailsUseCase(event.movieId);
    result.fold((error) {
      emit(
        state.copyWith(
          status: RequestStatus.error,
          message: error.message,
        ),
      );
    }, (movieDetails) {
      emit(
        state.copyWith(
          status: RequestStatus.loaded,
          movieDetails: movieDetails,
        ),
      );
    });
  }
}
