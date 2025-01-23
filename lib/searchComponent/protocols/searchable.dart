import 'package:campus_flutter/base/extensions/string_remove_diacritics.dart';
import 'package:campus_flutter/base/extensions/string_valid_chars.dart';
import 'package:campus_flutter/searchComponent/model/comparison_token.dart';
import 'package:json_annotation/json_annotation.dart';

abstract class Searchable {
  @JsonKey(includeFromJson: false, includeToJson: false)
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
