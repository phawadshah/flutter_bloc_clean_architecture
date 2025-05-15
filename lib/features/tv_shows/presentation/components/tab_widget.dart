import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sgm_block/core/domain/entities/media_details.dart';
import 'package:sgm_block/core/presentation/components/error_widget.dart';
import 'package:sgm_block/core/presentation/components/loader.dart';
import 'package:sgm_block/core/presentation/components/media_grid.dart';
import 'package:sgm_block/core/presentation/components/tab_bar.dart';
import 'package:sgm_block/features/tv_shows/domain/enitites/tv_show_details.dart';
import 'package:sgm_block/features/tv_shows/presentation/components/episode_list.dart';
import 'package:sgm_block/features/tv_shows/presentation/components/seasons_dropdown.dart.dart';
import 'package:sgm_block/features/tv_shows/presentation/controllers/tv_show_details_bloc/tv_show_details_bloc.dart';
import 'package:sgm_block/features/tv_shows/presentation/controllers/tv_show_details_bloc/tv_show_details_event.dart';
import 'package:sgm_block/features/tv_shows/presentation/controllers/tv_show_details_bloc/tv_show_details_state.dart';
import 'package:sgm_block/utils/constants/strings.dart';
import 'package:sgm_block/utils/constants/values.dart';
import 'package:sgm_block/utils/enums.dart';
import 'package:sgm_block/utils/extensions/extensions.dart';

class TabWidget extends StatelessWidget {
  const TabWidget({
    super.key,
    required this.tvShowDetails,
  });

  final MediaDetails tvShowDetails;

  @override
  Widget build(BuildContext context) {
    return KTabBar(
      tabs: [
        Tab(
          text: KStrings.episodes.toUpperCase(),
        ),
        Tab(
          text: KStrings.youMayAlsoLike.toUpperCase(),
        )
      ],
      tabViews: [
        const TvShowEpisodesTabView(),
        KMediaGrid(medias: tvShowDetails.similar),
      ],
    );
  }
}

class TvShowEpisodesTabView extends StatelessWidget {
  const TvShowEpisodesTabView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: height / 1.5),
      child: BlocBuilder<TvShowDetailsBloc, TvShowDetailsState>(
        builder: (context, state) {
          switch (state.episodesStatus) {
            case RequestStatus.loading:
              return KLoader(key: key);
            case RequestStatus.loaded:
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SeasonDropDownWidget(
                    selectedSeason: state.selectedSeason,
                    seasons: (state.mediaDetails as TvShowDetails).seasons,
                    onSeasonSelected: (season) {
                      if (season != null && season != state.selectedSeason) {
                        context.read<TvShowDetailsBloc>().add(
                              ChangeSeasonEvent(season),
                            );
                      }
                    },
                  ),
                  KGaps.small.height,
                  TvShowEpisodesList(episodes: state.tvShowEpisodes),
                ],
              );
            case RequestStatus.error:
              return KErrorWidget(
                message: state.episodesMessage,
                onPressed: () {
                  context
                      .read<TvShowDetailsBloc>()
                      .add(GetTvShowEpisodesEvent(state.mediaDetails!.id, 1));
                },
              );
            case RequestStatus.retrying:
              return (KRetryLoader(key: key));
          }
        },
      ),
    );
  }
}
