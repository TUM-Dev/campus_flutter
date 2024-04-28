import 'package:campus_flutter/main.dart';
import 'package:campus_flutter/navigation_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class Navigation extends ConsumerWidget {
  const Navigation({
    Key? key,
    required this.navigationShell,
  }) : super(key: key ?? const ValueKey('ScaffoldWithNestedNavigation'));

  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: getIt<NavigationService>().title(
          navigationShell.currentIndex,
          context,
        ),
        leading: getIt<NavigationService>().searchButton(
          navigationShell.currentIndex,
          ref,
          context,
        ),
        actions: getIt<NavigationService>().actions(
          navigationShell.currentIndex,
          context,
        ),
        bottom: getIt<NavigationService>().bottom(context, ref),
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
            ),
          ),
        ),
        child: NavigationBar(
          height: getIt<NavigationService>().navigationBarHeight,
          selectedIndex: navigationShell.currentIndex,
          onDestinationSelected: _goBranch,
          destinations: getIt<NavigationService>().bottomNavItems(context),
        ),
      ),
      floatingActionButton: getIt<NavigationService>().floatingActionButton(
        navigationShell.currentIndex,
        ref,
        context,
      ),
      body: navigationShell,
    );
  }
}
