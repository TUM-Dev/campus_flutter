import 'package:campus_flutter/calendarComponent/views/calendars_view.dart';
import 'package:campus_flutter/gradeComponent/views/grades_view.dart';
import 'package:campus_flutter/homeComponent/home_screen.dart';
import 'package:campus_flutter/lectureComponent/views/lectures_view.dart';
import 'package:campus_flutter/placesComponent/views/places_screen.dart';
import 'package:campus_flutter/providers_get_it.dart';
import 'package:campus_flutter/searchComponent/views/search_body_view.dart';
import 'package:campus_flutter/theme.dart';
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
  double _searchAreaHeight = 0.0;
  bool _isSearching = false;
  bool showContent = false;

  void _toggleSearch() {
    setState(() {
      ref.read(searchViewModel).clear();
      showContent = false;
      _isSearching = !_isSearching;
      _searchAreaHeight =
          _isSearching ? MediaQuery.sizeOf(context).height : 0.0;
    });
  }

  void _closeSearch() {
    setState(() {
      showContent = false;
      _isSearching = false;
      _searchAreaHeight = 0.0;
    });
  }

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
            leadingWidth: (kIsWeb && isLandScape) ? 80 : null,
            leading: (kIsWeb && isLandScape)
                ? Padding(
                    padding: const EdgeInsets.all(15),
                    child: Image.asset('assets/images/logos/tum-logo-blue.png',
                        fit: BoxFit.scaleDown))
                : IconButton(
                    onPressed: () => _toggleSearch(),
                    icon: const Icon(Icons.search)),
            title: (() {
              switch (currentPageIndex) {
                case 0:
                  if (kIsWeb && isLandScape) {
                    return Text(context.localizations.home,
                        style: Theme.of(context).textTheme.titleLarge);
                  } else {
                    return Image.asset('assets/images/logos/tum-logo-blue.png',
                        fit: BoxFit.cover, height: 20);
                  }
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
            actions: <Widget>[
              if (kIsWeb && isLandScape)
                IconButton(
                    onPressed: () => _toggleSearch(),
                    icon: const Icon(Icons.search)),
              IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SettingsView()));
                  },
                  icon: const Icon(Icons.settings)),
            ],
          ), //: null,
          bottomNavigationBar:
              (kIsWeb && isLandScape) ? null : _bottomNavigationBar(),
          body: Stack(
            children: [
              SafeArea(
                  child: (kIsWeb && isLandScape)
                      ? _webNavigationRail(context)
                      : _navigationBody()),
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: _searchAreaHeight,
                child: _isSearching
                    ? SearchView(
                        index: currentPageIndex, showContent: showContent)
                    : null,
                onEnd: () {
                  setState(() {
                    showContent = !showContent;
                  });
                },
              ),
            ],
          ));
    });
  }

  Widget _navigationBody() {
    switch (currentPageIndex) {
      case 0:
        return HomeScreen();
      case 1:
        return const GradesView();
      case 2:
        return const LecturesView();
      case 3:
        return const CalendarsView();
      case 4:
        return const PlacesScreen();
      default:
        return HomeScreen();
    }
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
            _closeSearch();
            ref.read(searchViewModel).clear();
            setState(() {
              currentPageIndex = index;
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
              currentPageIndex = index;
            });
          },
          labelType: NavigationRailLabelType.all,
          destinations: <NavigationRailDestination>[
            NavigationRailDestination(
              icon: const Icon(Icons.home_outlined),
              selectedIcon: const Icon(Icons.home),
              label: Text(context.localizations.home),
            ),
            NavigationRailDestination(
              icon: const Icon(Icons.school_outlined),
              selectedIcon: const Icon(Icons.school),
              label: Text(context.localizations.grades),
            ),
            NavigationRailDestination(
              icon: const Icon(Icons.class_outlined),
              selectedIcon: const Icon(Icons.class_),
              label: Text(context.localizations.lectures),
            ),
            NavigationRailDestination(
              icon: const Icon(Icons.calendar_month_outlined),
              selectedIcon: const Icon(Icons.calendar_month),
              label: Text(context.localizations.calendar),
            ),
            NavigationRailDestination(
              icon: const Icon(Icons.place_outlined),
              selectedIcon: const Icon(Icons.place),
              label: Text(context.localizations.places),
            ),
          ],
        ),
        //const VerticalDivider(thickness: 1, width: 1),
        Expanded(child: _navigationBody()),
      ],
    );
  }
}
