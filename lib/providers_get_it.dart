import 'dart:io';
import 'dart:ui';
import 'package:campus_flutter/calendarComponent/model/calendar_event.dart';
import 'package:campus_flutter/calendarComponent/viewModels/calendar_viewmodel.dart';
import 'package:campus_flutter/departuresComponent/viewModel/departures_viewmodel.dart';
import 'package:campus_flutter/gradeComponent/viewModels/grade_viewmodel.dart';
import 'package:campus_flutter/homeComponent/split_view_viewmodel.dart';
import 'package:campus_flutter/lectureComponent/model/lecture.dart';
import 'package:campus_flutter/lectureComponent/viewModels/lecture_details_viewmodel.dart';
import 'package:campus_flutter/lectureComponent/viewModels/lecture_viewmodel.dart';
import 'package:campus_flutter/loginComponent/viewModels/login_viewmodel.dart';
import 'package:campus_flutter/movieComponent/viewModel/movies_viewmodel.dart';
import 'package:campus_flutter/newsComponent/viewModel/news_viewmodel.dart';
import 'package:campus_flutter/personDetailedComponent/viewModel/person_details_viewmodel.dart';
import 'package:campus_flutter/placesComponent/viewModels/cafeteria_widget_viewmodel.dart';
import 'package:campus_flutter/placesComponent/viewModels/studyroom_widget_viewmodel.dart';
import 'package:campus_flutter/profileComponent/model/profile.dart';
import 'package:campus_flutter/profileComponent/viewModel/profile_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

/// get_it instance for singleton services
final getIt = GetIt.instance;

/// state providers for user interaction
final selectedLecture = StateProvider<Lecture?>((ref) => null);
final selectedEvent = StateProvider<CalendarEvent?>((ref) => null);
final selectedProfile = StateProvider<Profile?>((ref) => null);
final useWebView = StateProvider<bool>((ref) => true);
final locale = StateProvider<Locale>((ref) => _getDeviceLocale());

Locale _getDeviceLocale() {
  final deviceLocal = Platform.localeName;
  if (deviceLocal.contains("de")) {
    return const Locale("de");
  } else {
    return const Locale("en");
  }
}

/// viewModels for RiverPod - state is uninitialized at first
final loginViewModel = Provider((ref) => LoginViewModel());
final departureViewModel = Provider((ref) => DeparturesViewModel());
final profileViewModel = Provider.autoDispose((ref) {
  final profileViewModel = ProfileViewModel();
  profileViewModel.fetch(false);
  ref.keepAlive();
  return profileViewModel;
});
final profileDetailsViewModel = Provider.autoDispose((ref) {
  final profile = ref.watch(profileViewModel).profile.value;
  final profileDetailsViewModel = PersonDetailsViewModel(profile);
  profileDetailsViewModel.fetch(false);
  ref.keepAlive();
  return profileDetailsViewModel;
});
final personDetailsViewModel = Provider((ref) {
  final profile = ref.watch(selectedProfile);
  return PersonDetailsViewModel(profile);
});
final cafeteriaWidgetViewModel = Provider((ref) => CafeteriaWidgetViewModel());
final studyRoomWidgetViewModel = Provider((ref) => StudyRoomWidgetViewModel());
final newsViewModel = Provider((ref) => NewsViewModel());
final movieViewModel = Provider((ref) => MovieViewModel());
final lectureViewModel = Provider((ref) => LectureViewModel());
final lectureDetailsViewModel = Provider((ref) {
  final event = ref.watch(selectedEvent);
  final lecture = ref.watch(selectedLecture);
  return LectureDetailsViewModel(event: event, lecture: lecture);
});
final gradeViewModel = Provider((ref) => GradeViewModel());
final calendarViewModel = Provider((ref) => CalendarViewModel());
final homeSplitViewModel = Provider((ref) => SplitViewViewModel());
final lectureSplitViewModel = Provider((ref) => SplitViewViewModel());
