import 'package:sgm_block/utils/constants/strings.dart';

class KRouteNames {
  static const String splash = "splash";
  static const String movies = "movies";
  static const String tvShows = "tv-shows";
  static const String movieDetails = "movie-details";
  static const String moviesList = "movies-list";
  static const String person = "person";
}

class KPaths {
  static const String splash = "/${KRouteNames.splash}";
  static const String movies = "/${KRouteNames.movies}";
  static const String tvShows = "/${KRouteNames.tvShows}";
  static const String movieDetails =
      "/${KRouteNames.movieDetails}/:${KPathParameters.movieId}";
  static const String moviesList =
      "/${KRouteNames.moviesList}/:${KPathParameters.category}";
  static const String person =
      "/${KRouteNames.person}/:${KPathParameters.personId}";
}
