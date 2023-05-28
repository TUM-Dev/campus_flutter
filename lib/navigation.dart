import 'package:campus_flutter/calendarComponent/viewModels/calendarViewModel.dart';
import 'package:campus_flutter/calendarComponent/views/calendarView.dart';
import 'package:campus_flutter/gradeComponent/views/gradesView.dart';
import 'package:campus_flutter/gradeComponent/viewModels/gradeViewModel.dart';
import 'package:campus_flutter/homeComponent/homeScreen.dart';
import 'package:campus_flutter/loginComponent/loginViewModel.dart';
import 'package:campus_flutter/MapComponent/map.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

import 'package:provider/provider.dart';

import 'lectureComponent/views/lectureView.dart';

const settings = '/settings';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int currentPageIndex = 0;

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
                return Text("Grades",
                    style: Theme.of(context).textTheme.titleLarge);
              case 2:
                return Text("Lectures",
                    style: Theme.of(context).textTheme.titleLarge);
              case 3:
                return Text("Calendar",
                    style: Theme.of(context).textTheme.titleLarge);
              case 4:
                return Text("Places",
                    style: Theme.of(context).textTheme.titleLarge);
              default:
                return Image.asset('assets/images/logos/tum-logo-blue.png',
                    fit: BoxFit.contain, height: 20);
            }
          }()),
          actions: <Widget>[
            IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
            IconButton(
                onPressed: () {
                  Provider.of<LoginViewModel>(context, listen: false).logout();
                },
                icon: const Icon(Icons.logout_rounded))
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
            Provider(create: (context) => GradeViewModel(), child: const GradesView()),
            const LectureView(),
            Provider(create: (context) => CalendarViewModel(), child: const CalendarView()),
            const PlacesWidget()
          ][currentPageIndex],
        ));
  }
}
