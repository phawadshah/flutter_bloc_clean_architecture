import 'package:sgm_block/utils/constants/strings.dart';

class KRouteNames {
  static const String splash = "splash";

  // Movies
  static const String movies = "movies";
  static const String movieDetails = "movie-details";
  static const String moviesList = "movies-list";

  // Tv Shows
  static const String tvShows = "tv-shows";
  static const String tvShowDetails = "tv-show-details";
  static const String tvShowsList = "tv-shows-list";

  static const String person = "person";
}

class KPaths {
  static const String splash = "/${KRouteNames.splash}";

  // Movies
  static const String movies = "/${KRouteNames.movies}";
  static const String movieDetails =
      "/${KRouteNames.movieDetails}/:${KPathParameters.mediaId}";
  static const String moviesList =
      "/${KRouteNames.moviesList}/:${KPathParameters.category}";

  // Tv Shows
  static const String tvShows = "/${KRouteNames.tvShows}";
  static const String tvShowDetails =
      "/${KRouteNames.tvShowDetails}/:${KPathParameters.mediaId}";
  static const String tvShowsList =
      "/${KRouteNames.tvShowsList}/:${KPathParameters.category}";

  static const String person =
      "/${KRouteNames.person}/:${KPathParameters.personId}";
}
