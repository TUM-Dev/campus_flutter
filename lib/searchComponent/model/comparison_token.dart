class ComparisonToken {
  final String value;
  final ComparisonTokenType type;

  ComparisonToken({
    required this.value,
    this.type = ComparisonTokenType.tokenized,
  });

  static bool isEqual(ComparisonToken lhs, ComparisonToken rhs) {
    if (lhs.value.length != rhs.value.length) {
      return false;
    }

    for (int i in Iterable<int>.generate(lhs.value.length)) {
      if (lhs.value.codeUnits[i] != rhs.value.codeUnits[i]) {
        return false;
      }
    }

    return true;
  }
}

enum ComparisonTokenType { tokenized, raw }
