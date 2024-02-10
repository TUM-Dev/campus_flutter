import 'package:campus_flutter/base/enums/campus.dart';
import 'package:campus_flutter/base/routing/router_service.dart';
import 'package:campus_flutter/base/routing/routes.dart';
import 'package:campus_flutter/calendarComponent/model/calendar_event.dart';
import 'package:campus_flutter/calendarComponent/views/calendars_view.dart';
import 'package:campus_flutter/departuresComponent/views/departures_details_view.dart';
import 'package:campus_flutter/gradeComponent/views/grades_view.dart';
import 'package:campus_flutter/homeComponent/home_screen.dart';
import 'package:campus_flutter/lectureComponent/model/lecture.dart';
import 'package:campus_flutter/lectureComponent/views/lecture_details_view.dart';
import 'package:campus_flutter/lectureComponent/views/lectures_view.dart';
import 'package:campus_flutter/onboardingComponent/views/login_view.dart';
import 'package:campus_flutter/main.dart';
import 'package:campus_flutter/navigation.dart';
import 'package:campus_flutter/placesComponent/model/studyRooms/study_room_group.dart';
import 'package:campus_flutter/placesComponent/views/cafeterias/cafeterias_view.dart';
import 'package:campus_flutter/placesComponent/views/campuses/campus_scaffold.dart';
import 'package:campus_flutter/placesComponent/views/places_screen.dart';
import 'package:campus_flutter/placesComponent/views/studyGroups/study_room_group_scaffold.dart';
import 'package:campus_flutter/placesComponent/views/studyGroups/study_rooms_view.dart';
import 'package:campus_flutter/settingsComponent/views/settings_scaffold.dart';
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
              path: grades,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: GradesView(),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: lectures,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: LecturesView(),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: calendar,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: CalendarsView(),
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
    ),
    GoRoute(
      path: lectureDetails,
      builder: (context, state) => LectureDetailsScaffold(
        lecture: state.extra as Lecture,
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
      path: studyRooms,
      builder: (context, state) => const StudyRoomsScaffold(),
    ),
    GoRoute(
      path: cafeterias,
      builder: (context, state) => const CafeteriasScaffold(),
    ),
    GoRoute(
      path: campus,
      builder: (context, state) => CampusScaffold(
        campus: state.extra as Campus,
      ),
    ),
  ],
);
