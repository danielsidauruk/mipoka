String getFileNameFromUrl(String url) {
  Uri decodedUri = Uri.parse(Uri.decodeFull(url));
  String filename = decodedUri.pathSegments.last;
  return filename;
}