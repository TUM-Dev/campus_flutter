import 'package:campus_flutter/calendarComponent/views/calendars_view.dart';
import 'package:campus_flutter/gradeComponent/views/grades_view.dart';
import 'package:campus_flutter/homeComponent/home_screen.dart';
import 'package:campus_flutter/lectureComponent/views/lectures_view.dart';
import 'package:campus_flutter/providers_get_it.dart';
import 'package:flutter/cupertino.dart';
import 'package:campus_flutter/settingsComponent/views/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io' show Platform;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
              ? Padding(padding: const EdgeInsets.all(15),
              child: Image.asset('assets/images/logos/tum-logo-blue.png',
                  fit: BoxFit.scaleDown))
              : IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          title: (() {
            switch (currentPageIndex) {
              case 0:
                if (kIsWeb && isLandScape) {
                  return Text(AppLocalizations.of(context)!.home,
                      style: Theme
                          .of(context)
                          .textTheme
                          .titleLarge);
                } else {
                  return Image.asset('assets/images/logos/tum-logo-blue.png',
                      fit: BoxFit.cover, height: 20);
                }
              case 1:
                return Text(AppLocalizations.of(context)!.grades,
                    style: Theme
                        .of(context)
                        .textTheme
                        .titleLarge);
              case 2:
                return Text(AppLocalizations.of(context)!.lectures,
                    style: Theme
                        .of(context)
                        .textTheme
                        .titleLarge);
              case 3:
                return Text(AppLocalizations.of(context)!.calendar,
                    style: Theme
                        .of(context)
                        .textTheme
                        .titleLarge);
              case 4:
                return Text(AppLocalizations.of(context)!.places,
                    style: Theme
                        .of(context)
                        .textTheme
                        .titleLarge);
              default:
                return Image.asset('assets/images/logos/tum-logo-blue.png',
                    fit: BoxFit.contain, height: 20);
            }
          }()),
          actions: <Widget>[
            if (kIsWeb && isLandScape)
              IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const SettingsView()));
                },
                icon: const Icon(Icons.settings)),
          ],
        ), //: null,
        bottomNavigationBar: (kIsWeb && isLandScape)
            ? null
            : _bottomNavigationBar(),
        body: SafeArea(
            child: (kIsWeb && isLandScape)
                ? _webNavigationRail(context)
                : _navigationBody()),
      );
    });
  }

  Widget _navigationBody() {
    return <Widget>[
      HomeScreen(),
      const GradesView(),
      const LecturesView(),
      const CalendarsView(),
      Text(AppLocalizations.of(context)!.comingSoon), // TODO: replace with places widget
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
          destinations: <Widget>[
            NavigationDestination(
              icon: const Icon(Icons.house_outlined),
              selectedIcon: const Icon(Icons.house),
              label: AppLocalizations.of(context)!.home,
            ),
            NavigationDestination(
              icon: const Icon(Icons.school_outlined),
              selectedIcon: const Icon(Icons.school),
              label: AppLocalizations.of(context)!.grades,
            ),
            NavigationDestination(
              icon: const Icon(Icons.class_outlined),
              selectedIcon: const Icon(Icons.class_),
              label: AppLocalizations.of(context)!.lectures,
            ),
            NavigationDestination(
              icon: const Icon(Icons.calendar_month_outlined),
              selectedIcon: const Icon(Icons.calendar_month),
              label: AppLocalizations.of(context)!.calendar,
            ),
            NavigationDestination(
              icon: const Icon(Icons.place_outlined),
              selectedIcon: const Icon(Icons.place),
              label: AppLocalizations.of(context)!.places,
            ),
          ],
        ));
  }

  Widget _webNavigationRail(BuildContext context) {
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
          destinations: <NavigationRailDestination>[
            NavigationRailDestination(
              icon: const Icon(Icons.home_outlined),
              selectedIcon: const Icon(Icons.home),
              label: Text(AppLocalizations.of(context)!.home),
            ),
            NavigationRailDestination(
              icon: const Icon(Icons.school_outlined),
              selectedIcon: const Icon(Icons.school),
              label: Text(AppLocalizations.of(context)!.grades),
            ),
            NavigationRailDestination(
              icon: const Icon(Icons.class_outlined),
              selectedIcon: const Icon(Icons.class_),
              label: Text(AppLocalizations.of(context)!.lectures),
            ),
            NavigationRailDestination(
              icon: const Icon(Icons.calendar_month_outlined),
              selectedIcon: const Icon(Icons.calendar_month),
              label: Text(AppLocalizations.of(context)!.calendar),
            ),
            NavigationRailDestination(
              icon: const Icon(Icons.place_outlined),
              selectedIcon: const Icon(Icons.place),
              label: Text(AppLocalizations.of(context)!.places),
            ),
          ],
        ),
        //const VerticalDivider(thickness: 1, width: 1),
        Expanded(child: _navigationBody()),
      ],
    );
  }
}
