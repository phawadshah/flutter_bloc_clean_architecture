import 'package:sgm_block/core/data/network/api_constants.dart';

class APiUrls {
  static Uri _buildUrl(String endpoint,
      {Map<String, String>? queryParameters}) {
    return Uri.https(ApiConstants.baseUrl, endpoint, {
      ...queryParameters ?? {},
      ApiQueryParameters.key: ApiConstants.apiKey,
      ApiQueryParameters.language: "en-US"
    });
  }

  /// ====== Movies

  static Uri getTrendingMovies({int page = 1}) {
    return _buildUrl(ApiEndpoints.trendingMovies,
        queryParameters: {ApiQueryParameters.page: page.toString()});
  }

  static Uri getNowPlayingMovies({int page = 1}) {
    return _buildUrl(ApiEndpoints.nowPlayingMovies,
        queryParameters: {ApiQueryParameters.page: page.toString()});
  }

  static Uri getPopularMovies({int page = 1}) {
    return _buildUrl(ApiEndpoints.popularMovies,
        queryParameters: {ApiQueryParameters.page: page.toString()});
  }

  static Uri getTopRatedMovies({int page = 1}) {
    return _buildUrl(ApiEndpoints.topRatedMovies,
        queryParameters: {ApiQueryParameters.page: page.toString()});
  }

  static Uri getUpcomingMovies({int page = 1}) {
    return _buildUrl(ApiEndpoints.upcomingMovies,
        queryParameters: {ApiQueryParameters.page: page.toString()});
  }

  static Uri getMovieDetails(int id) {
    return _buildUrl("${ApiEndpoints.movie}/$id", queryParameters: {
      ApiQueryParameters.appendToResponse: "credits,similar,reviews,videos"
    });
  }

  static Uri getMoviesList(String category, int page) {
    return _buildUrl("${ApiEndpoints.movie}/$category",
        queryParameters: {ApiQueryParameters.page: page.toString()});
  }

  /// ======== Tv Show
  static Uri getTrendingTvShows({int page = 1}) {
    return _buildUrl(ApiEndpoints.trendingTvShows,
        queryParameters: {ApiQueryParameters.page: page.toString()});
  }

  static Uri getAiringTodayTvShows({int page = 1}) {
    return _buildUrl(ApiEndpoints.airingTodayTvShows,
        queryParameters: {ApiQueryParameters.page: page.toString()});
  }

  static Uri getOnTheAirTvShows({int page = 1}) {
    return _buildUrl(ApiEndpoints.onTheAirTvShows,
        queryParameters: {ApiQueryParameters.page: page.toString()});
  }

  static Uri getPopularTvShows({int page = 1}) {
    return _buildUrl(ApiEndpoints.popularTvShows,
        queryParameters: {ApiQueryParameters.page: page.toString()});
  }

  static Uri getTopRatedTvShows({int page = 1}) {
    return _buildUrl(ApiEndpoints.topRatedTvShows,
        queryParameters: {ApiQueryParameters.page: page.toString()});
  }

  static Uri getTvShowDetails(int id) {
    return _buildUrl("${ApiEndpoints.tv}/$id", queryParameters: {
      ApiQueryParameters.appendToResponse: "credits,similar,reviews,videos",
    });
  }

  static Uri getTvShowsList(String category, {int page = 1}) {
    return _buildUrl("${ApiEndpoints.tv}/$category",
        queryParameters: {ApiQueryParameters.page: page.toString()});
  }

  static Uri getTvShowEpisodes(int tvShowId, int season) {
    return _buildUrl("${ApiEndpoints.tv}/$tvShowId/season/$season");
  }

  /// Persons
  static Uri getPerson(int id) {
    return _buildUrl("${ApiEndpoints.person}/$id",
        queryParameters: {ApiQueryParameters.appendToResponse: "credits"});
  }
}
