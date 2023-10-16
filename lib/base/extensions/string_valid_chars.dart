extension ValidChars on String {
  String keepValidChars() {
    return replaceAll(RegExp(r'[^a-zA-Z0-9 ]'), '');
  }
}
