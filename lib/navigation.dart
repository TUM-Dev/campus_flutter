import 'package:campus_flutter/main.dart';
import 'package:campus_flutter/navigation_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final currentIndex = StateProvider<int>((ref) => 0);

class Navigation extends ConsumerStatefulWidget {
  const Navigation({super.key});

  @override
  ConsumerState<Navigation> createState() => _NavigationState();
}

class _NavigationState extends ConsumerState<Navigation> {
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
        title: getIt<NavigationService>().title(
          ref.watch(currentIndex),
          context,
        ),
        leading: getIt<NavigationService>().searchButton(context),
        actions: getIt<NavigationService>().actions(context),
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
          selectedIndex: ref.watch(currentIndex),
          onDestinationSelected: (index) {
            if (index != ref.read(currentIndex)) {
              _pageController.jumpToPage(index);
              ref.read(currentIndex.notifier).state = index;
            }
          },
          destinations: getIt<NavigationService>().bottomNavItems(context),
        ),
      ),
      floatingActionButton: getIt<NavigationService>().floatingActionButton(
        ref.watch(currentIndex),
        context,
      ),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: getIt<NavigationService>().getContent,
      ),
    );
  }
}
