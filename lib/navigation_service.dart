import 'dart:io';

import 'package:campus_flutter/calendarComponent/views/calendars_view.dart';
import 'package:campus_flutter/gradeComponent/views/grades_view.dart';
import 'package:campus_flutter/homeComponent/home_screen.dart';
import 'package:campus_flutter/lectureComponent/views/lectures_view.dart';
import 'package:campus_flutter/placesComponent/views/places_screen.dart';
import 'package:campus_flutter/searchComponent/views/appWideSearch/search_scaffold.dart';
import 'package:campus_flutter/settingsComponent/views/settings_scaffold.dart';
import 'package:campus_flutter/studentCardComponent/views/student_card_view.dart';
import 'package:campus_flutter/base/extensions/context.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class NavigationService {
  double? _navigationBarHeight;
  double? _leadingWidth;

  NavigationService() {
    if (kIsWeb) {
      _leadingWidth = 80;
    } else {
      if (Platform.isIOS) {
        _navigationBarHeight = 49;
      }
    }
  }

  double? get navigationBarHeight => _navigationBarHeight;

  double? get leadingWidth => _leadingWidth;

  List<Widget> get getContent => [
        const HomeScreen(),
        const GradesView(),
        const LecturesView(),
        const CalendarsView(),
        const PlacesScreen(),
      ];

  Widget title(int index, BuildContext context) {
    switch (index) {
      case 0:
        return Image.asset(
          'assets/images/logos/tum-logo-blue.png',
          fit: BoxFit.cover,
          height: 20,
        );
      case 1:
        return Text(
          context.localizations.grades,
          style: Theme.of(context).textTheme.titleLarge,
        );
      case 2:
        return Text(
          context.localizations.lectures,
          style: Theme.of(context).textTheme.titleLarge,
        );
      case 3:
        return Text(
          context.localizations.calendar,
          style: Theme.of(context).textTheme.titleLarge,
        );
      case 4:
        return Text(
          context.localizations.places,
          style: Theme.of(context).textTheme.titleLarge,
        );
      default:
        return Image.asset(
          'assets/images/logos/tum-logo-blue.png',
          fit: BoxFit.contain,
          height: 20,
        );
    }
  }

  Widget searchButton(BuildContext context) {
    return IconButton(
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SearchScaffold(),
        ),
      ),
      icon: const Icon(Icons.search),
    );
  }

  List<Widget> actions(BuildContext context) {
    return [
      IconButton(
        onPressed: () => _openStudentCardSheet(context),
        icon: const Icon(Icons.credit_card),
      ),
      IconButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const SettingsScaffold(),
            ),
          );
        },
        icon: const Icon(Icons.menu),
      ),
    ];
  }

  List<NavigationDestination> bottomNavItems(BuildContext context) =>
      <NavigationDestination>[
        NavigationDestination(
          icon: const Icon(Icons.house_outlined),
          selectedIcon: const Icon(Icons.house),
          label: context.localizations.home,
        ),
        NavigationDestination(
          icon: const Icon(Icons.school_outlined),
          selectedIcon: const Icon(Icons.school),
          label: context.localizations.grades,
        ),
        NavigationDestination(
          icon: const Icon(Icons.class_outlined),
          selectedIcon: const Icon(Icons.class_),
          label: context.localizations.lectures,
        ),
        NavigationDestination(
          icon: const Icon(Icons.calendar_month_outlined),
          selectedIcon: const Icon(Icons.calendar_month),
          label: context.localizations.calendar,
        ),
        NavigationDestination(
          icon: const Icon(Icons.place_outlined),
          selectedIcon: const Icon(Icons.place),
          label: context.localizations.places,
        ),
      ];

  void _openStudentCardSheet(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      useSafeArea: true,
      showDragHandle: true,
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: const StudentCardView(),
        );

        /// leave here for now, enables height adjusted to content
        /*return const SafeArea(child:
                         //Wrap(children: [
                          //StudentCardView()
                       ]));*/
      },
    );
  }
}
