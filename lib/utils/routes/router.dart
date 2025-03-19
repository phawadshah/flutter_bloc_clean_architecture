import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sgm_block/core/presentation/pages/root_page.dart';
import 'package:sgm_block/core/presentation/shells/movies_shell.dart';
import 'package:sgm_block/core/presentation/shells/tv_shows_shell.dart';
import 'package:sgm_block/core/presentation/pages/splash_page.dart';
import 'package:sgm_block/utils/routes/routes.dart';

class KRouter {
  static GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: KPaths.splash,
    routes: <RouteBase>[
      GoRoute(
        name: KRouteNames.splash,
        path: KPaths.splash,
        pageBuilder: (context, state) {
          return MaterialPage(
            key: state.pageKey,
            child: const SplashPage(),
          );
        },
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return RootPage(navigationShell);
        },
        branches: <StatefulShellBranch>[
          MoviesShell.shell(navigatorKey: _moviesKey),
          TvShowsShell.shell(navigatorKey: _tvShowsKey),
        ],
      ),
    ],
  );

  static final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'root');
  static final GlobalKey<NavigatorState> _moviesKey =
      GlobalKey<NavigatorState>(debugLabel: 'movies');
  static final GlobalKey<NavigatorState> _tvShowsKey =
      GlobalKey<NavigatorState>(debugLabel: 'tvShow');
}
