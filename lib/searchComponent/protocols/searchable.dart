import 'package:campus_flutter/base/extensions/string_remove_diacritics.dart';
import 'package:campus_flutter/base/extensions/string_valid_chars.dart';

import '../model/comparison_token.dart';

abstract class Searchable {
  late List<ComparisonToken> comparisonTokens;

  List<String> tokenize() {
    return comparisonTokens
        .map((comparisonToken) {
          if (comparisonToken.type == ComparisonTokenType.tokenized) {
            return comparisonToken.value
                .trim()
                .toLowerCase()
                .removeDiacritics()
                .keepValidChars()
                .split(" ");
          } else {
            return [comparisonToken.value];
          }
        })
        .expand((element) => element)
        .toList();
  }
}
