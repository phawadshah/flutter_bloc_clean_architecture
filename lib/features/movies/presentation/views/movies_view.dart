import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sgm_block/core/domain/entities/media.dart';
import 'package:sgm_block/core/presentation/components/error_widget.dart';
import 'package:sgm_block/core/presentation/components/loader.dart';
import 'package:sgm_block/core/presentation/components/media_section.dart';
import 'package:sgm_block/core/presentation/components/poster_slider.dart';
import 'package:sgm_block/core/services/service_locator.dart';
import 'package:sgm_block/features/movies/presentation/controllers/movies_bloc/movies_bloc.dart';
import 'package:sgm_block/features/movies/presentation/controllers/movies_bloc/movies_event.dart';
import 'package:sgm_block/features/movies/presentation/controllers/movies_bloc/movies_state.dart';
import 'package:sgm_block/features/movies/presentation/views/movies_list_view.dart';
import 'package:sgm_block/utils/constants/strings.dart';
import 'package:sgm_block/utils/constants/values.dart';
import 'package:sgm_block/utils/enums.dart';
import 'package:sgm_block/utils/extensions/extensions.dart';
import 'package:sgm_block/utils/helper.dart';

class MoviesView extends StatelessWidget {
  const MoviesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<MoviesBloc>()..add(GetMoviesEvent()),
      child: Scaffold(
        body: BlocBuilder<MoviesBloc, MoviesState>(
          builder: (context, state) {
            switch (state.status) {
              case RequestStatus.loading:
                return KLoader(key: key);
              case RequestStatus.loaded:
                return MoviesWidget(
                  trendingMovies: state.movies[0],
                  nowPlayingMovies: state.movies[1],
                  popularMovies: state.movies[2],
                  topRatedMovies: state.movies[3],
                  upComingMovies: state.movies[4],
                );
              case RequestStatus.error:
                return KErrorWidget(
                  message: state.message,
                  onPressed: () {
                    context.read<MoviesBloc>().add(GetMoviesEvent());
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

class MoviesWidget extends StatelessWidget {
  final List<Media> trendingMovies;
  final List<Media> nowPlayingMovies;
  final List<Media> popularMovies;
  final List<Media> topRatedMovies;
  final List<Media> upComingMovies;

  const MoviesWidget({
    super.key,
    required this.trendingMovies,
    required this.nowPlayingMovies,
    required this.popularMovies,
    required this.topRatedMovies,
    required this.upComingMovies,
  });

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            KPosterSlider(medias: trendingMovies),
            KGaps.medium.height,
            KMediaSection(
              title: KStrings.nowPlaying,
              medias: nowPlayingMovies,
            ),
            KMediaSection(
              title: KStrings.popular,
              medias: popularMovies,
            ),
            KMediaSection(
              title: KStrings.topRated,
              medias: topRatedMovies,
            ),
            KMediaSection(
              title: KStrings.upcoming,
              medias: upComingMovies,
            ),
          ],
        ),
      ),
    );
  }
}
