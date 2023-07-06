String toSnakeCase(String text) {
  String lowercaseString = text.toLowerCase();
  String replacedString = lowercaseString.replaceAll(' ', '_');
  return replacedString;
}