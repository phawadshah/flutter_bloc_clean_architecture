import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sgm_block/core/domain/entities/media_details.dart';
import 'package:sgm_block/core/presentation/components/cast_list_widget.dart';
import 'package:sgm_block/core/presentation/components/details_poster.dart';
import 'package:sgm_block/core/presentation/components/details_view_button.dart';
import 'package:sgm_block/core/presentation/components/error_widget.dart';
import 'package:sgm_block/core/presentation/components/expandable_text.dart';
import 'package:sgm_block/core/presentation/components/loader.dart';
import 'package:sgm_block/core/presentation/components/play_button.dart';
import 'package:sgm_block/core/presentation/components/reviews_slider.dart';
import 'package:sgm_block/core/services/service_locator.dart';
import 'package:sgm_block/features/movies/presentation/components/related_media.dart';
import 'package:sgm_block/features/movies/presentation/controllers/movies_details_bloc/movie_details_bloc.dart';
import 'package:sgm_block/features/movies/presentation/controllers/movies_details_bloc/movie_details_event.dart';
import 'package:sgm_block/features/movies/presentation/controllers/movies_details_bloc/movie_details_state.dart';
import 'package:sgm_block/utils/constants/values.dart';
import 'package:sgm_block/utils/enums.dart';
import 'package:sgm_block/utils/extensions/extensions.dart';

class MovieDetailsView extends StatelessWidget {
  final int movieId;
  const MovieDetailsView({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<MovieDetailsBloc>()..add(GetMovieDetailsEvent(movieId)),
      child: Scaffold(
        body: BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
          builder: (context, state) {
            switch (state.status) {
              case RequestStatus.loading:
                return KLoader(key: key);
              case RequestStatus.loaded:
                return MovieDetailsWidget(
                  movieDetails: state.movieDetails!,
                );
              case RequestStatus.error:
                return KErrorWidget(
                  message: state.message,
                  onPressed: () {
                    context
                        .read<MovieDetailsBloc>()
                        .add(GetMovieDetailsEvent(movieId));
                  },
                );
              case RequestStatus.retrying:
                return KRetryLoader(key: key);
            }
          },
        ),
      ),
    );
  }
}

class MovieDetailsWidget extends StatelessWidget {
  final MediaDetails movieDetails;
  final void Function()? onPlayPressed;
  const MovieDetailsWidget({
    super.key,
    required this.movieDetails,
    this.onPlayPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: SingleChildScrollView(
        child: Column(
          children: [
            KDetailsPoster(mediaDetails: movieDetails),
            KPlayButton(trailerUrl: movieDetails.trailerUrl),
            KGaps.medium.height,
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: KPaddings.sideDefault),
              child: KExpandableTextWidget(text: movieDetails.overview),
            ),
            KDetailsViewButtons(mediaDetails: movieDetails),
            KGaps.betweenItems.height,
            KCastListView(listOfCast: movieDetails.cast),
            KGaps.betweenItems.height,
            KReviewsSlider(reviews: movieDetails.reviews),
            KGaps.betweenItems.height,
            RelatedMovies(medias: movieDetails.similar),
            KGaps.betweenItems.height,
          ],
        ),
      ),
    );
  }
}
