import 'package:campus_flutter/calendarComponent/views/calendars_view.dart';
import 'package:campus_flutter/gradeComponent/views/grades_view.dart';
import 'package:campus_flutter/homeComponent/home_screen.dart';
import 'package:campus_flutter/lectureComponent/views/lectures_view.dart';
import 'package:campus_flutter/providers_get_it.dart';
import 'package:campus_flutter/studentCardComponent/views/student_card_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:campus_flutter/settingsComponent/views/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io' show Platform;

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
    return OrientationBuilder(builder: (context, orientation) {
      final isLandScape = orientation == Orientation.landscape;
      return Scaffold(
          extendBody: true,
          appBar: AppBar(
            centerTitle: true,
            leadingWidth: 80,
            leading: (kIsWeb && isLandScape)
                ? Padding(
                    padding: const EdgeInsets.all(15),
                    child: Image.asset('assets/images/logos/tum-logo-blue.png',
                        fit: BoxFit.scaleDown))
                : IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
            title: (() {
              switch (currentPageIndex) {
                case 0:
                  if (kIsWeb && isLandScape) {
                    return Text("Home",
                        style: Theme.of(context).textTheme.titleLarge);
                  } else {
                    return Image.asset('assets/images/logos/tum-logo-blue.png',
                        fit: BoxFit.cover, height: 20);
                  }
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
              if (kIsWeb && isLandScape)
                IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
              if (!kIsWeb)
                IconButton(
                    onPressed: () => _openStudentCardSheet(),
                    icon: const Icon(Icons.credit_card)),
              IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SettingsView()));
                  },
                  icon: const Icon(Icons.settings)),
            ],
          ),
          //: null,
          bottomNavigationBar:
              (kIsWeb && isLandScape) ? null : _bottomNavigationBar(),
          body: SafeArea(
              child: (kIsWeb && isLandScape)
                  ? _webNavigationRail()
                  : _navigationBody()),
          floatingActionButton: !kIsWeb
              ? FloatingActionButton(
                  onPressed: () => _openStudentCardSheet(),
                  child: const Icon(Icons.credit_card))
              : null);
    });
  }

  Widget _navigationBody() {
    return <Widget>[
      HomeScreen(),
      const GradesView(),
      const LecturesView(),
      const CalendarsView(),
      // TODO: replace with places widget
      const Text("Coming Soon")
    ][currentPageIndex];
  }

  Widget _bottomNavigationBar() {
    return DecoratedBox(
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

          /// Platform is not supported on web
          height: !kIsWeb
              ? Platform.isIOS
                  ? 49
                  : null
              : null,
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
        ));
  }

  Widget _webNavigationRail() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        NavigationRail(
          selectedIndex: currentPageIndex,
          onDestinationSelected: (int index) {
            setState(() {
              if (index != 4) {
                currentPageIndex = index;
              }
            });
          },
          labelType: NavigationRailLabelType.all,
          destinations: const <NavigationRailDestination>[
            NavigationRailDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home),
              label: Text('Home'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.school_outlined),
              selectedIcon: Icon(Icons.school),
              label: Text('Grades'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.class_outlined),
              selectedIcon: Icon(Icons.class_),
              label: Text('Lectures'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.calendar_month_outlined),
              selectedIcon: Icon(Icons.calendar_month),
              label: Text('Calendar'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.place_outlined),
              selectedIcon: Icon(Icons.place),
              label: Text('Places'),
            ),
          ],
        ),
        //const VerticalDivider(thickness: 1, width: 1),
        Expanded(child: _navigationBody()),
      ],
    );
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
