enum UserPreference {
  cafeteria(String),
  departure(int),
  studyRoom(int),
  homeWidgets(List<String>),
  theme(int),
  browser(bool),
  failedGrades(bool),
  locale(String);

  final Type type;

  const UserPreference(this.type);
}
