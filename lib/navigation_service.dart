import 'dart:io';

import 'package:campus_flutter/base/enums/credentials.dart';
import 'package:campus_flutter/base/routing/routes.dart';
import 'package:campus_flutter/homeComponent/widgetComponent/views/widget_screen.dart';
import 'package:campus_flutter/onboardingComponent/viewModels/onboarding_viewmodel.dart';
import 'package:campus_flutter/searchComponent/viewModels/global_search_viewmodel.dart';
import 'package:campus_flutter/studentCardComponent/views/student_card_view.dart';
import 'package:campus_flutter/base/extensions/context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class NavigationService {
  double? _navigationBarHeight;

  NavigationService() {
    if (Platform.isIOS) {
      _navigationBarHeight = 49;
    }
  }

  double? get navigationBarHeight => _navigationBarHeight;

  Widget title(int index, BuildContext context) {
    switch (index) {
      case 0:
        return Image.asset(
          'assets/images/logos/tum-logo-blue.png',
          fit: BoxFit.cover,
          height: 20,
        );
      case 1:
        return Text(
          context.localizations.grades,
          style: Theme.of(context).textTheme.titleLarge,
        );
      case 2:
        return Text(
          context.localizations.lectures,
          style: Theme.of(context).textTheme.titleLarge,
        );
      case 3:
        return Text(
          context.localizations.calendar,
          style: Theme.of(context).textTheme.titleLarge,
        );
      case 4:
        return Text(
          context.localizations.places,
          style: Theme.of(context).textTheme.titleLarge,
        );
      default:
        return Image.asset(
          'assets/images/logos/tum-logo-blue.png',
          fit: BoxFit.contain,
          height: 20,
        );
    }
  }

  Widget? floatingActionButton(int index, WidgetRef ref, BuildContext context) {
    switch (index) {
      case 3:
        if (ref.read(onboardingViewModel).credentials.value ==
            Credentials.tumId) {
          return FloatingActionButton(
            onPressed: () => context.push(eventCreation),
            child: const Icon(Icons.add),
          );
        } else {
          return null;
        }
      default:
        return null;
    }
  }

  Widget searchButton(int currentIndex, WidgetRef ref, BuildContext context) {
    return IconButton(
      onPressed: () {
        ref.read(searchViewModel).setSearchCategories(currentIndex);
        context.push(search);
      },
      icon: const Icon(Icons.search),
    );
  }

  List<Widget> actions(int currentIndex, BuildContext context) {
    return [
      if (currentIndex == 0)
        IconButton(
          onPressed: () => WidgetScreen.showHomeSheet(context),
          icon: const Icon(Icons.edit),
        ),
      if (MediaQuery.sizeOf(context).width < 600)
        IconButton(
          onPressed: () => openStudentCardSheet(context),
          icon: const Icon(Icons.credit_card),
        ),
      IconButton(
        onPressed: () => context.push(menuSettings),
        icon: const Icon(Icons.menu),
      ),
    ];
  }

  List<NavigationDestination> bottomNavItems(BuildContext context) =>
      <NavigationDestination>[
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
      ];

  static void openStudentCardSheet(BuildContext context) {
    if (MediaQuery.sizeOf(context).width < 600) {
      showModalBottomSheet(
        isScrollControlled: true,
        useSafeArea: true,
        useRootNavigator: true,
        showDragHandle: true,
        context: context,
        builder: (BuildContext context) {
          return SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: const StudentCardView(),
          );
        },
      );
    }
  }
}
