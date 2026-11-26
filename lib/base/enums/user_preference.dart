enum UserPreference {
  defaultCampus(String),
  cafeteria(String),
  departure(int),
  studyRoom(int),
  cinema(int),
  homeWidgets(List<String>),
  theme(int),
  calendarColors(String),
  browser(bool),
  studentCardPicture(bool),
  failedGrades(bool),
  weekends(bool),
  hiddenCalendarEntries(bool),
  calendarSync(bool),
  calendarTab(int),
  eventsCampus(int);

  final Type type;

  const UserPreference(this.type);
}
