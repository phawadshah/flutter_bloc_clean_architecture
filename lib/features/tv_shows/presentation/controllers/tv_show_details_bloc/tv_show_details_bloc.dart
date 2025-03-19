import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sgm_block/features/tv_shows/domain/usercase/get_tv_show_details_usecase.dart';
import 'package:sgm_block/features/tv_shows/presentation/controllers/tv_show_details_bloc/tv_show_details_event.dart';
import 'package:sgm_block/features/tv_shows/presentation/controllers/tv_show_details_bloc/tv_show_details_state.dart';
import 'package:sgm_block/utils/enums.dart';

class TvShowDetailsBloc extends Bloc<TvShowDetailsEvent, TvShowDetailsState> {
  final GetTvShowDetailsUsecase _getTvShowDetailsUsecase;
  TvShowDetailsBloc({
    required GetTvShowDetailsUsecase getTvShowDetailsUsecase,
  })  : _getTvShowDetailsUsecase = getTvShowDetailsUsecase,
        super(const TvShowDetailsState()) {
    on<GetTvShowDetailsEvent>(_getTvShowDetails);
  }

  Future _getTvShowDetails(
    GetTvShowDetailsEvent event,
    Emitter<TvShowDetailsState> emit,
  ) async {
    var errorOrResults = await _getTvShowDetailsUsecase(event.tvShowIdid);
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
    });
  }
}
