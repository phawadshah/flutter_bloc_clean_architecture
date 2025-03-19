extension MediaListTitle on String {
  String get movieListTitle =>
      '${replaceAll('_', ' ').split(' ').map((word) => word[0].toUpperCase() + word.substring(1)).join(' ')} Movies';

  String get tvShowsTitle =>
      '${replaceAll('_', ' ').split(' ').map((word) => word[0].toUpperCase() + word.substring(1)).join(' ')} Tv Shows';
}
