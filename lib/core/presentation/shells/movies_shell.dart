import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sgm_block/features/movies/presentation/views/movie_details_view.dart';
import 'package:sgm_block/features/movies/presentation/views/movies_list_view.dart';
import 'package:sgm_block/features/movies/presentation/views/movies_view.dart';
import 'package:sgm_block/features/persons/presentation/person_view/person_view.dart';
import 'package:sgm_block/utils/constants/strings.dart';
import 'package:sgm_block/utils/routes/routes.dart';

class MoviesShell {
  static shell({required GlobalKey<NavigatorState>? navigatorKey}) {
    return StatefulShellBranch(
      navigatorKey: navigatorKey,
      routes: _routes,
    );
  }

  static final List<GoRoute> _routes = [
    GoRoute(
      name: KRouteNames.movies,
      path: KPaths.movies,
      pageBuilder: (context, state) {
        return MaterialPage(
          key: state.pageKey,
          child: const MoviesView(),
        );
      },
    ),
    GoRoute(
      name: KRouteNames.moviesList,
      path: KPaths.moviesList,
      pageBuilder: (context, state) {
        String category =
            state.pathParameters[KPathParameters.category].toString();
        return MaterialPage(
          key: state.pageKey,
          child: MoviesListView(
            category: category,
          ),
        );
      },
    ),
    GoRoute(
      name: KRouteNames.movieDetails,
      path: KPaths.movieDetails,
      pageBuilder: (context, state) {
        int movieId =
            int.parse(state.pathParameters[KPathParameters.movieId].toString());
        return MaterialPage(
          key: state.pageKey,
          child: MovieDetailsView(
            movieId: movieId,
          ),
        );
      },
    ),
    GoRoute(
      name: KRouteNames.person,
      path: KPaths.person,
      pageBuilder: (context, state) {
        int personId = int.parse(
            state.pathParameters[KPathParameters.personId].toString());
        return MaterialPage(
          key: state.pageKey,
          child: PersonView(
            personId: personId,
          ),
        );
      },
    ),
  ];
}
