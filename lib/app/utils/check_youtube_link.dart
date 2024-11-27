bool isValidYouTubeLink(String url) {
  final RegExp youTubeRegExp = RegExp(
    r'^(https?:\/\/)?(www\.)?(youtube\.com\/(watch\?v=|embed\/|v\/|shorts\/)|youtu\.be\/)[\w\-]{11}',
    caseSensitive: false,
    multiLine: false,
  );

  return youTubeRegExp.hasMatch(url);
}
