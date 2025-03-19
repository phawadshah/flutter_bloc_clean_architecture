import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sgm_block/core/domain/entities/media_details.dart';
import 'package:sgm_block/core/presentation/components/cast_list_widget.dart';
import 'package:sgm_block/core/presentation/components/details_poster.dart';
import 'package:sgm_block/core/presentation/components/error_widget.dart';
import 'package:sgm_block/core/presentation/components/loader.dart';
import 'package:sgm_block/core/presentation/components/over_view.dart';
import 'package:sgm_block/core/presentation/components/play_button.dart';
import 'package:sgm_block/core/presentation/components/reviews_slider.dart';
import 'package:sgm_block/core/services/service_locator.dart';
import 'package:sgm_block/features/movies/presentation/components/related_media.dart';
import 'package:sgm_block/features/tv_shows/presentation/controllers/tv_show_details_bloc/tv_show_details_bloc.dart';
import 'package:sgm_block/features/tv_shows/presentation/controllers/tv_show_details_bloc/tv_show_details_event.dart';
import 'package:sgm_block/features/tv_shows/presentation/controllers/tv_show_details_bloc/tv_show_details_state.dart';
import 'package:sgm_block/utils/constants/colors.dart';
import 'package:sgm_block/utils/constants/values.dart';
import 'package:sgm_block/utils/enums.dart';
import 'package:sgm_block/utils/extensions/extensions.dart';

import '../../../../core/presentation/components/details_view_button.dart';

class TvShowDetailsView extends StatelessWidget {
  final int tvShowId;
  const TvShowDetailsView({super.key, required this.tvShowId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<TvShowDetailsBloc>()..add(GetTvShowDetailsEvent(tvShowId)),
      child: Scaffold(
        body: BlocBuilder<TvShowDetailsBloc, TvShowDetailsState>(
          builder: (context, state) {
            switch (state.status) {
              case RequestStatus.loading:
                return KRetryLoader(key: key);
              case RequestStatus.loaded:
                return TvShowDetailsWidget(
                  tvShowDetails: state.mediaDetails!,
                );
              case RequestStatus.error:
                return KErrorWidget(
                  message: state.message,
                  onPressed: () {
                    context
                        .read<TvShowDetailsBloc>()
                        .add(GetTvShowDetailsEvent(tvShowId));
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

class TvShowDetailsWidget extends StatelessWidget {
  final MediaDetails tvShowDetails;
  final void Function()? onPlayPressed;
  const TvShowDetailsWidget({
    super.key,
    required this.tvShowDetails,
    this.onPlayPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: SingleChildScrollView(
        child: Column(
          children: [
            KDetailsPoster(mediaDetails: tvShowDetails),
            KPlayButton(trailerUrl: tvShowDetails.trailerUrl),
            KGaps.medium.height,
            KOverViewWidget(mediaDetails: tvShowDetails),
            KGaps.betweenItems.height,
            KDetailsViewButtons(mediaDetails: tvShowDetails),
            // KGaps.betweenItems.height,
            // KCastListView(listOfCast: tvShowDetails.cast),
            // KGaps.betweenItems.height,
            // KReviewsSlider(reviews: tvShowDetails.reviews),
            // KGaps.betweenItems.height,
            // RelatedMovies(medias: tvShowDetails.similar),
            // KGaps.betweenItems.height,
          ],
        ),
      ),
    );
  }
}
