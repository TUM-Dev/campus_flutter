extension Levenshtein on String {
  int levenshtein(String comparisonToken) {
    if (isEmpty && comparisonToken.isEmpty) {
      return 0;
    } else if (isEmpty) {
      return comparisonToken.length;
    } else if (comparisonToken.isEmpty) {
      return length;
    }

    List<String> a = split('');
    List<String> b = comparisonToken.split('');

    List<List<int>> dist = List.generate(
      a.length + 1,
      (_) => List<int>.filled(b.length + 1, 0),
    );

    for (int i = 1; i <= a.length; i++) {
      dist[i][0] = i;
    }

    for (int j = 1; j <= b.length; j++) {
      dist[0][j] = j;
    }

    for (int i = 1; i <= a.length; i++) {
      for (int j = 1; j <= b.length; j++) {
        if (a[i - 1] == b[j - 1]) {
          dist[i][j] = dist[i - 1][j - 1]; // Noop
        } else {
          dist[i][j] = [
            dist[i - 1][j] + 1, // Deletion
            dist[i][j - 1] + 1, // Insertion
            dist[i - 1][j - 1] + 1, // Substitution
          ].reduce((min, current) => current < min ? current : min);
        }
      }
    }

    return dist[a.length][b.length];
  }
}
