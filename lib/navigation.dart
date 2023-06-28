import 'package:campus_flutter/calendarComponent/views/calendarsView.dart';
import 'package:campus_flutter/gradeComponent/views/grades_view.dart';
import 'package:campus_flutter/homeComponent/home_screen.dart';
import 'package:campus_flutter/providers_get_it.dart';
import 'package:campus_flutter/studentCardComponent/views/studentCardView.dart';
import 'package:flutter/cupertino.dart';
import 'package:campus_flutter/settingsComponent/views/settingsView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:io' show Platform;

import 'lectureComponent/views/lectureView.dart';

const settings = '/settings';

class Navigation extends ConsumerStatefulWidget {
  const Navigation({super.key});

  @override
  ConsumerState<Navigation> createState() => _NavigationState();
}

class _NavigationState extends ConsumerState<Navigation> {
  int currentPageIndex = 0;

  @override
  void initState() {
    ref.read(profileViewModel).fetch(true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          title: (() {
            switch (currentPageIndex) {
              case 0:
                return Image.asset('assets/images/logos/tum-logo-blue.png',
                    fit: BoxFit.contain, height: 20);
              case 1:
                return Text("Grades", style: Theme.of(context).textTheme.titleLarge);
              case 2:
                return Text("Lectures", style: Theme.of(context).textTheme.titleLarge);
              case 3:
                return Text("Calendar", style: Theme.of(context).textTheme.titleLarge);
              case 4:
                return Text("Places", style: Theme.of(context).textTheme.titleLarge);
              default:
                return Image.asset('assets/images/logos/tum-logo-blue.png',
                    fit: BoxFit.contain, height: 20);
            }
          }()),
          actions: <Widget>[
            IconButton(
                onPressed: () => _openStudentCardSheet(), icon: const Icon(Icons.credit_card)),
            IconButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => const SettingsView()));
                },
                icon: const Icon(Icons.settings)),
          ],
        ),
        bottomNavigationBar: DecoratedBox(
            decoration: const BoxDecoration(
              border: Border(
                  top: BorderSide(
                color: CupertinoDynamicColor.withBrightness(
                  color: Color(0x4C000000),
                  darkColor: Color(0x29000000),
                ),
                width: 0.0,
              )),
            ),
            child: NavigationBar(
              onDestinationSelected: (int index) {
                setState(() {
                  if (index != 4) {
                    currentPageIndex = index;
                  }
                });
              },
              height: Platform.isIOS ? 49 : null,
              selectedIndex: currentPageIndex,
              destinations: const <Widget>[
                NavigationDestination(
                  icon: Icon(Icons.house_outlined),
                  selectedIcon: Icon(Icons.house),
                  label: 'Home',
                ),
                NavigationDestination(
                  icon: Icon(Icons.school_outlined),
                  selectedIcon: Icon(Icons.school),
                  label: 'Grades',
                ),
                NavigationDestination(
                  icon: Icon(Icons.class_outlined),
                  selectedIcon: Icon(Icons.class_),
                  label: 'Lectures',
                ),
                NavigationDestination(
                  icon: Icon(Icons.calendar_month_outlined),
                  selectedIcon: Icon(Icons.calendar_month),
                  label: 'Calendar',
                ),
                NavigationDestination(
                  icon: Icon(Icons.place_outlined),
                  selectedIcon: Icon(Icons.place),
                  label: 'Places',
                ),
              ],
            )),
        body: SafeArea(
          child: <Widget>[
            const HomeScreen(),
            const GradesView(),
            const LectureView(),
            const CalendarsView(),
            // TODO: replace with places widget
            const Text("Coming Soon")
          ][currentPageIndex],
        ),
        floatingActionButton: /*FloatingActionButton.extended(
-          onPressed: () => _openStudentCardSheet(),
-          label: const IconText(
-              iconData: Icons.credit_card,
-              label: "StudentCard",
-              style: TextStyle(color: Colors.white),
-          ),
-      ),*/
            FloatingActionButton(
                onPressed: () => _openStudentCardSheet(), child: const Icon(Icons.credit_card)));
  }

  void _openStudentCardSheet() {
    showModalBottomSheet(
        isScrollControlled: true,
        useSafeArea: true,
        showDragHandle: true,
        context: context,
        builder: (BuildContext context) {
          return SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: const StudentCardView());

          /// leave here for now, enables height adjusted to content
          /*return const SafeArea(child:
                         //Wrap(children: [
                          //StudentCardView()
                       ]));*/
        });
  }
}
