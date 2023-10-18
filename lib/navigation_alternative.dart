import 'package:campus_flutter/calendarComponent/views/calendars_view.dart';
import 'package:campus_flutter/gradeComponent/views/grades_view.dart';
import 'package:campus_flutter/homeComponent/home_screen.dart';
import 'package:campus_flutter/lectureComponent/views/lectures_view.dart';
import 'package:campus_flutter/placesComponent/views/places_screen.dart';
import 'package:campus_flutter/searchComponent/views/appWideSearch/search_scaffold.dart';
import 'package:campus_flutter/settingsComponent/views/settings_view.dart';
import 'package:campus_flutter/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavigationAlternative extends ConsumerStatefulWidget {
  const NavigationAlternative({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _NavigationAlternativeState();
}

class _NavigationAlternativeState extends ConsumerState<NavigationAlternative> {
  int _selectedPage = 0;

  final List<Widget> _tabs = [
    HomeScreen(),
    Container(),
    Container(),
    Container(),
    Container(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          SearchScaffold(selectedPage: _selectedPage)),
                ),
            icon: const Icon(Icons.search)),
        title: (() {
          switch (_selectedPage) {
            case 0:
              return Image.asset('assets/images/logos/tum-logo-blue.png',
                  fit: BoxFit.cover, height: 20);
            case 1:
              return Text(context.localizations.grades,
                  style: Theme.of(context).textTheme.titleLarge);
            case 2:
              return Text(context.localizations.lectures,
                  style: Theme.of(context).textTheme.titleLarge);
            case 3:
              return Text(context.localizations.calendar,
                  style: Theme.of(context).textTheme.titleLarge);
            case 4:
              return Text(context.localizations.places,
                  style: Theme.of(context).textTheme.titleLarge);
            default:
              return Image.asset('assets/images/logos/tum-logo-blue.png',
                  fit: BoxFit.contain, height: 20);
          }
        }()),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const SettingsView()));
              },
              icon: const Icon(Icons.settings)),
        ],
      ),
      body: IndexedStack(
        index: _selectedPage,
        children: _tabs,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedPage,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: "House"),
          NavigationDestination(icon: Icon(Icons.school), label: "Grades"),
          NavigationDestination(icon: Icon(Icons.book), label: "Lectures"),
          NavigationDestination(
              icon: Icon(Icons.calendar_month), label: "Calendar"),
          NavigationDestination(icon: Icon(Icons.place), label: "Places"),
        ],
        onDestinationSelected: (index) {
          if (_tabs[index] is Container) {
            switch (index) {
              case 1:
                _tabs[index] = const GradesView();
              case 2:
                _tabs[index] = const LecturesView();
              case 3:
                _tabs[index] = const CalendarsView();
              case 4:
                _tabs[index] = const PlacesScreen();
            }
          }
          setState(() {
            _selectedPage = index;
          });
        },
        height: 49,
      ),
    );
  }
}
