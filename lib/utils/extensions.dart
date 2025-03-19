extension MediaListTitle on String {
  String get mediaListTitle =>
      '${replaceAll('_', ' ').split(' ').map((word) => word[0].toUpperCase() + word.substring(1)).join(' ')} Movies';
}
