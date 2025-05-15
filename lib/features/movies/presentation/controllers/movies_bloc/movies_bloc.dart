import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sgm_block/features/movies/domain/usecases/get_movies_usecase.dart';
import 'package:sgm_block/features/movies/presentation/controllers/movies_bloc/movies_event.dart';
import 'package:sgm_block/features/movies/presentation/controllers/movies_bloc/movies_state.dart';
import 'package:sgm_block/utils/enums.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetMoviesUsecase _getMoviesUseCase;
  MoviesBloc({required GetMoviesUsecase getMoviesUseCase})
      : _getMoviesUseCase = getMoviesUseCase,
        super(const MoviesState()) {
    on<GetMoviesEvent>(getMovies);
  }

  Future<void> getMovies(
    GetMoviesEvent event,
    Emitter<MoviesState> emit,
  ) async {
    if (state.status == RequestStatus.error) {
      emit(state.copyWith(status: RequestStatus.retrying));
    }
    final result = await _getMoviesUseCase(const []);
    result.fold(
      (error) => emit(
        state.copyWith(
          status: RequestStatus.error,
          message: error.message,
        ),
      ),
      (movies) => emit(
        state.copyWith(
          movies: movies,
          status: RequestStatus.loaded,
        ),
      ),
    );
  }
}
