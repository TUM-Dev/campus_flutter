import 'package:campus_flutter/base/extensions/string_remove_diacritics.dart';
import 'package:campus_flutter/base/extensions/string_valid_chars.dart';
import 'package:campus_flutter/searchComponent/protocols/searchable.dart';
import 'package:campus_flutter/base/extensions/string_levenshtein.dart';
import 'package:collection/collection.dart';

typedef Distances = List<int>;

class GlobalSearch {
  static List<T>? tokenSearch<T extends Searchable>(
    String query,
    List<T> searchables,
  ) {
    final tokens = tokenize(query);

    Map<T, Distances> levenshteinValues = {};

    for (final token in tokens) {
      for (final searchable in searchables) {
        final newDistance = bestRelativeLevenshtein(token, searchable);
        if (newDistance == null) {
          break;
        }

        if (levenshteinValues[searchable] == null) {
          levenshteinValues[searchable] = [];
          levenshteinValues[searchable]!.add(newDistance);
        }
        levenshteinValues[searchable]!.add(newDistance);
      }
    }

    final results =
        levenshteinValues.entries
            .sorted(
              (a, b) => isBetter(
                a.value.sorted((a, b) => a.compareTo(b)),
                b.value.sorted((a, b) => a.compareTo(b)),
              ),
            )
            .map((e) => (e.key, e.value))
            .toList();

    return results.map((e) => e.$1).toList();
  }

  static int? bestRelativeLevenshtein<T extends Searchable>(
    String token,
    T searchable,
  ) {
    if (token.isEmpty) {
      return null;
    }

    return searchable
        .tokenize()
        .map((dataToken) {
          if (dataToken.isEmpty) {
            return null;
          }

          final lev = token.levenshtein(dataToken);

          final result =
              (2 * lev).toDouble() /
              (1 * (token.length + dataToken.length) + lev).toDouble();

          return (result * 100).toInt();
        })
        .reduce(
          (min, current) =>
              current == null
                  ? min
                  : (min == null || current < min)
                  ? current
                  : min,
        );
  }

  static List<int>? relativeLevenshtein<T extends Searchable>(
    String token,
    T searchable,
  ) {
    if (token.isEmpty) {
      return null;
    }

    final result = searchable.tokenize().map((dataToken) {
      if (dataToken.isEmpty) {
        return null;
      }

      return ((token.levenshtein(dataToken).toDouble() / dataToken.length) *
              100)
          .toInt();
    });

    if (result.contains(null)) {
      return null;
    } else {
      return result.nonNulls.toList();
    }
  }

  static List<String> tokenize(String query) {
    return query.trim().toLowerCase().removeDiacritics().keepValidChars().split(
      " ",
    );
  }
}

int isBetter(List<int> lhs, List<int> rhs) {
  int index = lhs.length < rhs.length ? lhs.length : rhs.length;
  for (int i = 0; i < index; i++) {
    if (lhs[i] < rhs[i]) {
      return -1;
    } else if (lhs[i] > rhs[i]) {
      return 1;
    }
  }

  return rhs.length.compareTo(lhs.length);
}
