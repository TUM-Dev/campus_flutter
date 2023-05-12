import 'package:campus_flutter/calendarComponent/viewModels/calendarViewModel.dart';
import 'package:campus_flutter/calendarComponent/views/calendarView.dart';
import 'package:campus_flutter/gradeComponent/views/gradesView.dart';
import 'package:campus_flutter/gradeComponent/viewModels/gradeViewModel.dart';
import 'package:campus_flutter/homeComponent/home.dart';
import 'package:campus_flutter/loginComponent/loginViewModel.dart';
import 'package:campus_flutter/mapComponent/map.dart';
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
        title: Image.asset('assets/images/logos/tum-logo-blue.png',
            fit: BoxFit.contain, height: 20),
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
          IconButton(
              onPressed: () {
                Provider.of<LoginViewModel>(context, listen: false).logout();
              },
              icon: const Icon(Icons.logout_rounded))
        ],
      ),
      bottomNavigationBar: //ClipRect(child: BackdropFilter(
          //filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
          /*child:*/ NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            // TODO: remove
            if (index != 2 || index != 3) {
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
      ) /*))*/,
      body: <Widget>[
        const Home(),
        ChangeNotifierProvider(
            create: (context) => GradeViewModel(), child: const GradesView()),
        const LectureView(),
        Provider(create: (context) => CalendarViewModel(), child: const CalendarView()),
        const PlacesWidget()
      ][currentPageIndex],
    );
  }
}
