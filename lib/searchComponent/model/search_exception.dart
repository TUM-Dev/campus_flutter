class SearchException implements Exception {
  final String? searchQuery;

  SearchException.empty({required this.searchQuery});

  SearchException.unexpected() : searchQuery = null;

  String get message {
    if (searchQuery != null) {
      return "No search results were found for: ${searchQuery!.isEmpty ? "Empty Search" : searchQuery}";
    } else {
      return "An unexpected error occurred.";
    }
  }
}
