import 'package:campus_flutter/base/enums/campus.dart';
import 'package:campus_flutter/base/util/fullscreen_image_view.dart';
import 'package:campus_flutter/base/routing/router_service.dart';
import 'package:campus_flutter/base/routing/routes.dart';
import 'package:campus_flutter/calendarComponent/model/calendar_event.dart';
import 'package:campus_flutter/calendarComponent/views/calendars_view.dart';
import 'package:campus_flutter/calendarComponent/views/event_creation_view.dart';
import 'package:campus_flutter/campusComponent/screen/campus_screen.dart';
import 'package:campus_flutter/campusComponent/screen/movie_screen.dart';
import 'package:campus_flutter/campusComponent/screen/news_screen.dart';
import 'package:campus_flutter/campusComponent/screen/student_clubs_screen.dart';
import 'package:campus_flutter/homeComponent/view/departure/departures_details_view.dart';
import 'package:campus_flutter/feedbackComponent/views/feedback_form_view.dart';
import 'package:campus_flutter/feedbackComponent/views/feedback_success_view.dart';
import 'package:campus_flutter/homeComponent/screen/home_screen.dart';
import 'package:campus_flutter/navigaTumComponent/model/navigatum_roomfinder_map.dart';
import 'package:campus_flutter/navigaTumComponent/views/navigatum_room_view.dart';
import 'package:campus_flutter/onboardingComponent/views/confirm_view.dart';
import 'package:campus_flutter/onboardingComponent/views/location_permissions_view.dart';
import 'package:campus_flutter/onboardingComponent/views/login_view.dart';
import 'package:campus_flutter/main.dart';
import 'package:campus_flutter/navigation.dart';
import 'package:campus_flutter/onboardingComponent/views/permission_check_view.dart';
import 'package:campus_flutter/personComponent/views/person_details_view.dart';
import 'package:campus_flutter/placesComponent/model/cafeterias/cafeteria.dart';
import 'package:campus_flutter/placesComponent/model/studyRooms/study_room_group.dart';
import 'package:campus_flutter/placesComponent/views/cafeterias/cafeteria_view.dart';
import 'package:campus_flutter/placesComponent/views/cafeterias/cafeterias_view.dart';
import 'package:campus_flutter/placesComponent/views/campuses/campus_map_view.dart';
import 'package:campus_flutter/placesComponent/views/campuses/campus_scaffold.dart';
import 'package:campus_flutter/placesComponent/views/places_screen.dart';
import 'package:campus_flutter/placesComponent/views/studyGroups/study_room_group_scaffold.dart';
import 'package:campus_flutter/placesComponent/views/studyGroups/study_rooms_view.dart';
import 'package:campus_flutter/searchComponent/views/appWideSearch/search_scaffold.dart';
import 'package:campus_flutter/searchComponent/views/personRoomSearch/search_view.dart';
import 'package:campus_flutter/settingsComponent/views/settings_scaffold.dart';
import 'package:campus_flutter/studiesComponent/model/lecture.dart';
import 'package:campus_flutter/studiesComponent/screen/studies_screen.dart';
import 'package:campus_flutter/studiesComponent/view/lectureDetail/lecture_details_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final routerProvider = Provider((ref) => _router);

final _router = GoRouter(
  initialLocation: onboarding,
  redirect: (context, state) => getIt<RouterService>().routingCallback(state),
  routes: [
    GoRoute(
      path: onboarding,
      builder: (context, state) => const LoginView(),
    ),
    GoRoute(
      path: confirm,
      builder: (context, state) => const ConfirmView(),
    ),
    GoRoute(
      path: permissionCheck,
      builder: (context, state) => PermissionCheckView(
        isSettingsView: (state.extra as bool?) ?? false,
      ),
    ),
    GoRoute(
      path: locationPermission,
      builder: (context, state) => const LocationPermissionView(),
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, shell) => Navigation(
        navigationShell: shell,
      ),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: home,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: HomeScreen(),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: studies,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: StudiesScreen(),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: calendar,
              pageBuilder: (context, state) => NoTransitionPage(
                child: CalendarsView(),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: campus,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: CampusScreen(),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: places,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: PlacesScreen(),
              ),
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: cafeteriaWidget,
      builder: (context, state) => CafeteriaScaffold(
        cafeteria: state.extra as Cafeteria,
      ),
    ),
    GoRoute(
      path: departures,
      builder: (context, state) => const DeparturesDetailsScaffold(),
    ),
    GoRoute(
      path: closestStudyRoom,
      builder: (context, state) => StudyRoomGroupScaffold(
        state.extra as StudyRoomGroup,
      ),
    ),
    GoRoute(
      path: menuSettings,
      builder: (context, state) => const SettingsScaffold(),
      routes: [
        GoRoute(
          path: "feedback",
          builder: (context, state) => const FeedbackFormScaffold(),
          routes: [
            GoRoute(
              path: "success",
              builder: (context, state) => const FeedbackSuccessView(),
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: lectureDetails,
      builder: (context, state) => LectureDetailsScaffold(
        lecture: state.extra as Lecture?,
      ),
    ),
    GoRoute(
      path: calendarDetails,
      builder: (context, state) => LectureDetailsScaffold(
        event: state.extra as CalendarEvent,
        scrollController: null,
      ),
    ),
    GoRoute(
      path: studentClubs,
      builder: (context, state) => const StudentClubsScreen(),
    ),
    GoRoute(
      path: news,
      builder: (context, state) => const NewsScreen(),
    ),
    GoRoute(
      path: movies,
      builder: (context, state) => const MovieScreen(),
    ),
    GoRoute(
      path: studyRooms,
      builder: (context, state) => const StudyRoomsScaffold(),
    ),
    GoRoute(
      path: cafeterias,
      builder: (context, state) => const CafeteriasScaffold(),
    ),
    GoRoute(
      path: place,
      builder: (context, state) => CampusScaffold(
        campus: state.extra as Campus,
      ),
      routes: [
        GoRoute(
          path: "map",
          builder: (context, state) => CampusMapScaffold(
            campus: state.extra as Campus,
          ),
        ),
      ],
    ),
    GoRoute(
      path: navigaTum,
      builder: (context, state) => NavigaTumRoomScaffold(
        id: state.extra as String,
      ),
    ),
    GoRoute(
      path: personDetails,
      builder: (context, state) => PersonDetailsScaffold(
        obfuscatedId: state.extra as String,
      ),
    ),
    GoRoute(
      path: cafeteria,
      builder: (context, state) => CafeteriaScaffold(
        cafeteria: state.extra as Cafeteria,
      ),
    ),
    GoRoute(
      path: search,
      builder: (context, state) => const SearchScaffold(),
    ),
    GoRoute(
      path: studyRoom,
      builder: (context, state) => StudyRoomGroupScaffold(
        state.extra as StudyRoomGroup,
      ),
    ),
    GoRoute(
      path: networkImage,
      builder: (context, state) {
        final data = state.extra as (String, NavigaTumRoomFinderMap?);
        return ImageFullScreenScaffold.network(
          url: data.$1,
          map: data.$2,
        );
      },
    ),
    GoRoute(
      path: localeImage,
      builder: (context, state) => ImageFullScreenScaffold.imageData(
        imageData: state.extra as String,
      ),
    ),
    GoRoute(
      path: roomSearch,
      builder: (context, state) {
        final data = state.extra as (String?, bool?);
        return PersonRoomSearchScaffold(
          searchString: data.$1,
          isRoomSearch: data.$2 ?? true,
        );
      },
    ),
    GoRoute(
      path: eventCreation,
      builder: (context, state) => EventCreationScaffold(
        calendarEvent: state.extra as CalendarEvent?,
      ),
    ),
  ],
);
