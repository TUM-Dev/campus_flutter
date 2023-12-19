import 'package:campus_flutter/main.dart';
import 'package:campus_flutter/navigation_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final currentIndex = StateProvider<int>((ref) => 0);

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Consumer(
          builder: (context, ref, child) => getIt<NavigationService>()
              .title(ref.watch(currentIndex), context),
        ),
        leading: getIt<NavigationService>().searchButton(context),
        actions: getIt<NavigationService>().actions(context),
      ),
      // TODO: fix floating action button
      /*floatingActionButton: FloatingActionButton(
        onPressed: () => _openStudentCardSheet(),
        child: const Icon(Icons.credit_card),
      ),*/
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
        child: Consumer(
          builder: (context, ref, child) {
            return NavigationBar(
              height: getIt<NavigationService>().navigationBarHeight,
              selectedIndex: ref.watch(currentIndex),
              onDestinationSelected: (index) {
                if (index != ref.read(currentIndex)) {
                  _pageController.jumpToPage(index);
                  ref.read(currentIndex.notifier).state = index;
                }
              },
              destinations: getIt<NavigationService>().bottomNavItems(context),
            );
          },
        ),
      ),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: getIt<NavigationService>().getContent,
      ),
    );
  }
}
