enum SearchCategory {
  /// enums that exist in the Text Classification Model
  cafeterias("Cafeterias"),
  calendar("Calendar"),
  grade("Grades"),
  movie("Movies"),
  news("News"),
  studyRoom("Study Rooms"),
  unknown("Unknown"),

  /// enums that are not classified but shown in searches
  lectures("Lectures"),
  personalLectures("Personal Lectures"),
  persons("Persons");

  final String title;

  const SearchCategory(this.title);

  factory SearchCategory.fromString(String category) {
    switch (category) {
      case "cafeterias":
        return SearchCategory.cafeterias;
      case "calendar":
        return SearchCategory.calendar;
      case "grade":
        return SearchCategory.grade;
      case "movie":
        return SearchCategory.movie;
      case "news":
        return SearchCategory.news;
      case "studyroom":
        return SearchCategory.studyRoom;
      default:
        return SearchCategory.unknown;
    }
  }
}

extension SearchCategoryExtension on SearchCategory {
  static List<SearchCategory> lectureSearch() {
    return [SearchCategory.personalLectures, SearchCategory.lectures];
  }

  static List<SearchCategory> authorizedSearch() {
    //const all = SearchCategory.values;
    //all.remove(SearchCategory.unknown);
    return SearchCategory.values;
  }

  static List<SearchCategory> unAuthorizedSearch() {
    return [
      SearchCategory.studyRoom,
      SearchCategory.cafeterias,
      SearchCategory.movie,
      SearchCategory.news
    ];
  }
}
