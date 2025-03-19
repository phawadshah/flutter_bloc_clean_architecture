import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sgm_block/features/tv_shows/presentation/views/tv_show_details.dart';
import 'package:sgm_block/features/tv_shows/presentation/views/tv_shows_list_view.dart';
import 'package:sgm_block/features/tv_shows/presentation/views/tv_shows_view.dart';
import 'package:sgm_block/utils/constants/strings.dart';
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
    GoRoute(
      name: KRouteNames.tvShowsList,
      path: KPaths.tvShowsList,
      pageBuilder: (context, state) {
        String category =
            state.pathParameters[KPathParameters.category].toString();
        return MaterialPage(
          key: state.pageKey,
          child: TvShowsListView(
            category: category,
          ),
        );
      },
    ),
    GoRoute(
      name: KRouteNames.tvShowDetails,
      path: KPaths.tvShowDetails,
      pageBuilder: (context, state) {
        String tvShowId =
            state.pathParameters[KPathParameters.mediaId].toString();
        return MaterialPage(
          key: state.pageKey,
          child: TvShowDetailsView(
            tvShowId: int.parse(tvShowId),
          ),
        );
      },
    ),
  ];
}
