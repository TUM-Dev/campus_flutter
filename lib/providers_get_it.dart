import 'package:campus_flutter/calendarComponent/model/calendarEvent.dart';
import 'package:campus_flutter/calendarComponent/viewModels/calendarViewModel.dart';
import 'package:campus_flutter/departuresComponent/viewModel/departuresViewModel.dart';
import 'package:campus_flutter/gradeComponent/viewModels/grade_viewmodel.dart';
import 'package:campus_flutter/lectureComponent/model/lecture.dart';
import 'package:campus_flutter/lectureComponent/viewModels/lectureDetailsViewModel.dart';
import 'package:campus_flutter/lectureComponent/viewModels/lectureViewModel.dart';
import 'package:campus_flutter/loginComponent/viewModels/loginViewModel.dart';
import 'package:campus_flutter/movieComponent/viewModel/movieViewModel.dart';
import 'package:campus_flutter/newsComponent/viewModel/newsViewModel.dart';
import 'package:campus_flutter/personDetailedComponent/viewModel/personDetailsViewModel.dart';
import 'package:campus_flutter/placesComponent/viewModels/cafeteria_widget_viewmodel.dart';
import 'package:campus_flutter/placesComponent/viewModels/studyroom_widget_viewmodel.dart';
import 'package:campus_flutter/profileComponent/model/profile.dart';
import 'package:campus_flutter/profileComponent/viewModel/profileViewModel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

/// get_it instance for singleton services
final getIt = GetIt.instance;

/// state providers for user interaction
final selectedLecture = StateProvider<Lecture?>((ref) => null);
final selectedEvent = StateProvider<CalendarEvent?>((ref) => null);
final selectedProfile = StateProvider<Profile?>((ref) => null);

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
  final profile = ref.watch(profileViewModel).profile.value?.$2;
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