import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sgm_block/features/tv_shows/presentation/views/tv_shows_view.dart';
import 'package:sgm_block/utils/routes/routes.dart';

class TvShowsShell {
  static shell({required GlobalKey<NavigatorState>? navigatorKey}) {
    return StatefulShellBranch(
      navigatorKey: navigatorKey,
      routes: _routes,
    );
  }

  static final List<GoRoute> _routes = [
    GoRoute(
      name: KRouteNames.tvShows,
      path: KPaths.tvShows,
      pageBuilder: (context, state) {
        return MaterialPage(
          key: state.pageKey,
          child: const TvShowsView(),
        );
      },
    ),
  ];
}
