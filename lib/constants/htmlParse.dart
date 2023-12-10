String removeHtmlTags(String htmlText) {
  final RegExp regExp = RegExp(r'<[^>]*>', multiLine: true);
  return htmlText.replaceAll(regExp, '');
}