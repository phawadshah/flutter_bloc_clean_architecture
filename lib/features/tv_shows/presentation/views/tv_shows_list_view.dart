import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sgm_block/core/presentation/components/error_widget.dart';
import 'package:sgm_block/core/presentation/components/loader.dart';
import 'package:sgm_block/core/presentation/components/paginated_media_grid.dart';
import 'package:sgm_block/core/services/service_locator.dart';
import 'package:sgm_block/features/tv_shows/presentation/controllers/tv_shows_list_bloc/tv_shows_list_bloc.dart';
import 'package:sgm_block/features/tv_shows/presentation/controllers/tv_shows_list_bloc/tv_shows_list_event.dart';
import 'package:sgm_block/features/tv_shows/presentation/controllers/tv_shows_list_bloc/tv_shows_list_state.dart';
import 'package:sgm_block/utils/enums.dart';
import 'package:sgm_block/utils/extensions/extensions.dart';
import 'package:sgm_block/utils/helper.dart';

class TvShowsListView extends StatelessWidget {
  final String category;
  const TvShowsListView({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<TvShowsListBloc>()..add(GetTvShowsListEvent(category)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(getMediaTitle(category, isMovie: false),
              style: context.titleMedium),
        ),
        body: BlocBuilder<TvShowsListBloc, TvShowsListState>(
          builder: (context, state) {
            switch (state.status) {
              case RequestStatus.loading:
                return KLoader(key: key);
              case RequestStatus.loaded:
                return KPaginatedMediaGrid(
                  medias: state.mediaList!.mediaList,
                  isLoadingMore: state.isLoadingMore,
                  onPageReached: () {
                    if (state.isLoadingMore) return;
                    context.read<TvShowsListBloc>().add(
                          LoadMoreTvShowsListEvent(
                            category,
                            page: state.mediaList!.page + 1,
                          ),
                        );
                  },
                );
              case RequestStatus.error:
                return KErrorWidget(
                  message: state.message,
                  onPressed: () {
                    context
                        .read<TvShowsListBloc>()
                        .add(GetTvShowsListEvent(category));
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
