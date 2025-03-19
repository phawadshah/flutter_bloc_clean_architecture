import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sgm_block/core/domain/entities/media.dart';
import 'package:sgm_block/core/presentation/components/error_widget.dart';
import 'package:sgm_block/core/presentation/components/loader.dart';
import 'package:sgm_block/core/presentation/components/media_card.dart';
import 'package:sgm_block/core/services/service_locator.dart';
import 'package:sgm_block/features/movies/presentation/controllers/movies_list_bloc/movies_list_bloc.dart';
import 'package:sgm_block/features/movies/presentation/controllers/movies_list_bloc/movies_list_event.dart';
import 'package:sgm_block/features/movies/presentation/controllers/movies_list_bloc/movies_list_state.dart';
import 'package:sgm_block/utils/constants/values.dart';
import 'package:sgm_block/utils/enums.dart';
import 'package:sgm_block/utils/extensions.dart';
import 'package:sgm_block/utils/extensions/extensions.dart';

class MoviesListView extends StatelessWidget {
  final String category;
  const MoviesListView({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<MoviesListBloc>()..add(GetMoviesListEvent(category)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(category.mediaListTitle),
        ),
        body: BlocBuilder<MoviesListBloc, MoviesListState>(
          builder: (context, state) {
            switch (state.status) {
              case RequestStatus.loading:
                return KLoader(key: key);
              case RequestStatus.loaded:
                return KPaginatedMoviesWidget(
                  movies: state.mediaList!.mediaList,
                  isLoadingMore: state.isLoadingMore,
                  onPageReached: () {
                    if (state.isLoadingMore) return;
                    context.read<MoviesListBloc>().add(
                          LoadMoreMoviesListEvent(
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
                        .read<MoviesListBloc>()
                        .add(GetMoviesListEvent(category));
                  },
                );
            }
          },
        ),
      ),
    );
  }
}

class KPaginatedMoviesWidget extends StatefulWidget {
  final List<Media> movies;
  final bool isLoadingMore;
  final void Function()? onPageReached;
  const KPaginatedMoviesWidget({
    super.key,
    required this.movies,
    this.onPageReached,
    this.isLoadingMore = false,
  });

  @override
  State<KPaginatedMoviesWidget> createState() => _KPaginatedMoviesWidgetState();
}

class _KPaginatedMoviesWidgetState extends State<KPaginatedMoviesWidget> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 300) {
      widget.onPageReached?.call();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: _scrollController,
      child: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.all(KPaddings.sideDefault),
            sliver: SliverGrid.builder(
              itemCount: widget.movies.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisExtent: 180,
                crossAxisSpacing: KPaddings.sideDefault,
                mainAxisSpacing: KPaddings.sideDefault,
              ),
              itemBuilder: (context, index) {
                return KMediaCard(
                    media: widget.movies[index], showRating: true);
              },
            ),
          ),
          if (widget.isLoadingMore)
            SliverList(
              delegate: SliverChildListDelegate([
                KGaps.small.height,
                const KLoader(),
              ]),
            ),
          SliverToBoxAdapter(child: KGaps.betweenItems.height),
        ],
      ),
    );
  }
}
