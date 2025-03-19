class ApiConstants {
  static const String apiKey = '03da7d5a8ff9bcce5eaf5d1ec9d8ea9e';
  static const String token =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwM2RhN2Q1YThmZjliY2NlNWVhZjVkMWVjOWQ4ZWE5ZSIsIm5iZiI6MTc0MjAxOTIwMi45MTIsInN1YiI6IjY3ZDUxYTgyMzE1MzhkZTYwOGYxNTc4OSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.FJdDRMnMdQOcEg_qxZMDoxq33G-zJubLgQiYC2SuYMI';

  static const String baseUrl = 'api.themoviedb.org';
  static const String baseBackdropUrl = 'https://image.tmdb.org/t/p/w1280';
  static const String basePosterUrl = 'https://image.tmdb.org/t/p/w500';
  static const String baseProfileUrl = 'https://image.tmdb.org/t/p/w200';
  static const String baseStillUrl = 'https://image.tmdb.org/t/p/w500';
  static const String baseAvatarUrl = 'https://image.tmdb.org/t/p/w185';
  static const String baseVideoUrl = 'https://www.youtube.com/watch?v=';

  static const String moviePlaceHolder =
      'https://davidkoepp.com/wp-content/themes/blankslate/images/Movie%20Placeholder.jpg';

  static const String castPlaceHolder =
      'https://palmbayprep.org/wp-content/uploads/2015/09/user-icon-placeholder.png';

  static const String avatarPlaceHolder =
      'https://cdn.pixabay.com/photo/2018/11/13/21/43/avatar-3814049__480.png';

  static const String stillPlaceHolder =
      'https://popcornsg.s3.amazonaws.com/gallery/1577405144-six-year.png';
}

class ApiEndpoints {
  static const String trendingMovies = '/3/trending/movie/day';
  static const String nowPlayingMovies = '/3/movie/now_playing';
  static const String popularMovies = '/3/movie/popular';
  static const String topRatedMovies = '/3/movie/top_rated';
  static const String upcomingMovies = '/3/movie/upcoming';
  static const String movie = '/3/movie';

  // Tv Shows
  static const String trendingTvShows = '3/trending/tv/day';
  static const String airingTodayTvShows = '/3/tv/airing_today';
  static const String onTheAirTvShows = '/3/tv/on_the_air';
  static const String popularTvShows = '/3/tv/popular';
  static const String topRatedTvShows = '/3/tv/top_rated';
  static const String tv = '/3/tv';

  /// Person
  static const String person = '/3/person';
}

class ApiHeaders {
  static const String accept = 'accept';
  static const String authorization = 'Authorization';
  static Map<String, String> buildHeaders(String token) {
    return {
      ApiHeaders.accept: 'application/json',
      ApiHeaders.authorization: 'Bearer $token',
    };
  }
}

class ApiQueryParameters {
  static const String language = 'language';
  static const String page = 'page';
  static const String key = 'api_key';
  static const String appendToResponse = 'append_to_response';
}
