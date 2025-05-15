import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sgm_block/core/domain/entities/media.dart';
import 'package:sgm_block/core/presentation/components/error_widget.dart';
import 'package:sgm_block/core/presentation/components/loader.dart';
import 'package:sgm_block/core/presentation/components/media_section.dart';
import 'package:sgm_block/core/presentation/components/poster_slider.dart';
import 'package:sgm_block/core/services/service_locator.dart';
import 'package:sgm_block/features/tv_shows/presentation/controllers/tv_shows_bloc/tv_shows_bloc.dart';
import 'package:sgm_block/features/tv_shows/presentation/controllers/tv_shows_bloc/tv_shows_event.dart';
import 'package:sgm_block/features/tv_shows/presentation/controllers/tv_shows_bloc/tv_shows_state.dart';
import 'package:sgm_block/utils/constants/strings.dart';
import 'package:sgm_block/utils/constants/values.dart';
import 'package:sgm_block/utils/enums.dart';
import 'package:sgm_block/utils/extensions/extensions.dart';

class TvShowsView extends StatelessWidget {
  const TvShowsView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<TvShowsBloc>()..add(GetTvShowsEvent()),
      child: Scaffold(
        body: BlocBuilder<TvShowsBloc, TvShowsState>(
          builder: (context, state) {
            switch (state.status) {
              case RequestStatus.loading:
                return KLoader(key: key);
              case RequestStatus.loaded:
                return TvShowsWidget(
                  trending: state.tvShows[0],
                  airingToday: state.tvShows[1],
                  onTheAir: state.tvShows[2],
                  popular: state.tvShows[3],
                  topRated: state.tvShows[4],
                );
              case RequestStatus.error:
                return KErrorWidget(
                  message: state.message,
                  onPressed: () {
                    context.read<TvShowsBloc>().add(GetTvShowsEvent());
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

class TvShowsWidget extends StatelessWidget {
  final List<Media> trending;
  final List<Media> airingToday;
  final List<Media> onTheAir;
  final List<Media> popular;
  final List<Media> topRated;
  const TvShowsWidget({
    super.key,
    required this.trending,
    required this.airingToday,
    required this.onTheAir,
    required this.popular,
    required this.topRated,
  });

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: SingleChildScrollView(
        child: Column(
          children: [
            KPosterSlider(medias: trending),
            KGaps.medium.height,
            KMediaSection(title: KStrings.airingToday, medias: airingToday),
            KMediaSection(title: KStrings.onTheAir, medias: onTheAir),
            KMediaSection(title: KStrings.popular, medias: popular),
            KMediaSection(title: KStrings.topRated, medias: topRated),
          ],
        ),
      ),
    );
  }
}
