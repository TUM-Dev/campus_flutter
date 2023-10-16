import 'dart:io';
import 'dart:ui';
import 'package:campus_flutter/base/enums/appearance.dart';
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
import 'package:campus_flutter/navigaTumComponent/viewModels/navigatum_details_viewmodel.dart';
import 'package:campus_flutter/navigaTumComponent/viewModels/navigatum_search_viewmodel.dart';
import 'package:campus_flutter/navigaTumComponent/viewModels/navigatum_viewmodel.dart';
import 'package:campus_flutter/newsComponent/viewModel/news_viewmodel.dart';
import 'package:campus_flutter/personDetailedComponent/viewModel/person_details_viewmodel.dart';
import 'package:campus_flutter/placesComponent/viewModels/cafeterias_viewmodel.dart';
import 'package:campus_flutter/placesComponent/viewModels/places_viewmodel.dart';
import 'package:campus_flutter/placesComponent/viewModels/study_rooms_viewmodel.dart';
import 'package:campus_flutter/profileComponent/model/profile.dart';
import 'package:campus_flutter/profileComponent/viewModel/profile_viewmodel.dart';
import 'package:campus_flutter/searchComponent/viewmodels/global_search_viewmodel.dart';
import 'package:campus_flutter/searchComponent/viewmodels/searchableViewModels/cafeteria_search_viewmodel.dart';
import 'package:campus_flutter/searchComponent/viewmodels/searchableViewModels/calendar_search_viewmodel.dart';
import 'package:campus_flutter/searchComponent/viewmodels/searchableViewModels/grades_search_viewmodel.dart';
import 'package:campus_flutter/searchComponent/viewmodels/searchableViewModels/lecture_search_viewmodel.dart';
import 'package:campus_flutter/searchComponent/viewmodels/searchableViewModels/news_search_viewmodel.dart';
import 'package:campus_flutter/searchComponent/viewmodels/searchableViewModels/personal_lecture_seach_viewmodel.dart';
import 'package:campus_flutter/searchComponent/viewmodels/searchableViewModels/movie_search_viewmodel.dart';
import 'package:campus_flutter/personSearchComponent/viewModel/person_search_viewmodel.dart';
import 'package:campus_flutter/searchComponent/viewmodels/searchableViewModels/study_room_search_viewmodel.dart';
import 'package:campus_flutter/settingsComponent/viewModels/settings_viewmodel.dart';
import 'package:campus_flutter/settingsComponent/viewModels/user_preferences_viewmodel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:map_launcher/map_launcher.dart';

/// get_it instance for singleton services
final getIt = GetIt.instance;

/// state providers for user interaction
final selectedProfile = StateProvider<Profile?>((ref) => null);
final useWebView = StateProvider<bool>((ref) => true);
final hideFailedGrades = StateProvider<bool>((ref) => false);
final selectedMapsApp = StateProvider<AvailableMap?>((ref) => null);
final locale = StateProvider<Locale>((ref) => _getDeviceLocale());
final appearance = StateProvider<Appearance>((ref) => Appearance.system);

Locale _getDeviceLocale() {
  if (kIsWeb) {
    return const Locale("en");
  } else {
    final deviceLocal = Platform.localeName;
    if (deviceLocal.contains("de")) {
      return const Locale("de");
    } else {
      return const Locale("en");
    }
  }
}

/// viewModels for RiverPod - state is uninitialized at first
/// view model for authentication handling
final loginViewModel = Provider((ref) => LoginViewModel());

/// view model for users profile
final profileViewModel = Provider.autoDispose((ref) {
  final profileViewModel = ProfileViewModel();
  profileViewModel.fetch(false);
  ref.keepAlive();
  return profileViewModel;
});

/// view model for users details and person details
final profileDetailsViewModel = Provider.autoDispose((ref) {
  final profile = ref.watch(profileViewModel).profile.value;
  final profileDetailsViewModel = PersonDetailsViewModel(profile?.obfuscatedID);
  profileDetailsViewModel.fetch(false);
  ref.keepAlive();
  return profileDetailsViewModel;
});
final personDetailsViewModel =
    Provider.family<PersonDetailsViewModel, String>((ref, obfuscatedId) {
  return PersonDetailsViewModel(obfuscatedId);
});

/// view model for places
final placesViewModel = Provider((ref) => PlacesViewModel(ref));
final navigaTumViewModel = Provider((ref) => NavigaTumViewModel());
final navigaTumDetailsViewModel =
    Provider.family<NavigaTumDetailsViewModel, String>(
        (ref, id) => NavigaTumDetailsViewModel(id, ref));
final cafeteriasViewModel = Provider((ref) => CafeteriasViewModel());
final studyRoomsViewModel = Provider((ref) => StudyRoomsViewModel());

/// view model for news
final newsViewModel = Provider((ref) => NewsViewModel());

/// view model for movies
final movieViewModel = Provider((ref) => MovieViewModel());

/// view model for lectures
final lectureViewModel = Provider((ref) => LectureViewModel());
final lectureDetailsViewModel =
    Provider.family<LectureDetailsViewModel, (CalendarEvent?, Lecture?)>(
        (ref, data) =>
            LectureDetailsViewModel(event: data.$1, lecture: data.$2));

/// view model for grades
final gradeViewModel = Provider((ref) => GradeViewModel(ref));

/// view model for calendar
final calendarViewModel = Provider((ref) => CalendarViewModel());

/// view model for departures
final departureViewModel = Provider((ref) => DeparturesViewModel());

/// view model for landscape mode
final homeSplitViewModel = Provider((ref) => SplitViewViewModel());

/// view model for landscape mode of lectures
final lectureSplitViewModel = Provider((ref) => SplitViewViewModel());

/// view models for settings
final settingsViewModel = Provider((ref) => SettingsViewModel(ref));
final userPreferencesViewModel =
    Provider((ref) => UserPreferencesViewModel(ref));

/// search view models
final searchViewModel = Provider((ref) => GlobalSearchViewModel(ref));
final gradesSearchViewModel = Provider((ref) => GradesSearchViewModel());
final lectureSearchViewModel = Provider((ref) => LectureSearchViewModel());
final personalLectureSearchViewModel =
    Provider((ref) => PersonalLectureSearchViewModel());
final cafeteriaSearchViewModel = Provider((ref) => CafeteriaSearchViewModel());
final movieSearchViewModel = Provider((ref) => MovieSearchViewModel());
final newsSearchViewModel = Provider((ref) => NewsSearchViewModel());
final calendarSearchViewModel = Provider((ref) => CalendarSearchViewModel());
final studyRoomSearchViewModel = Provider((ref) => StudyRoomSearchViewModel());
final personSearchViewModel = Provider((ref) => PersonSearchViewModel());
final navigaTumSearchViewModel = Provider((ref) => NavigaTumSearchViewModel());
