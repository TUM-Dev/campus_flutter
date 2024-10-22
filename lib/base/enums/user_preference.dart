enum UserPreference {
  cafeteria(String),
  departure(int),
  studyRoom(int),
  homeWidgets(List<String>),
  theme(int),
  calendarColors(String),
  browser(bool),
  failedGrades(bool),
  weekends(bool),
  hiddenCalendarEntries(bool),
  calendarTab(int);

  final Type type;

  const UserPreference(this.type);
}
