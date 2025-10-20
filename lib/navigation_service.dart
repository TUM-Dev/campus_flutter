import 'dart:io';

import 'package:campus_flutter/base/enums/credentials.dart';
import 'package:campus_flutter/base/enums/search_type.dart';
import 'package:campus_flutter/base/routing/routes.dart';
import 'package:campus_flutter/homeComponent/view/widget/widget_screen.dart';
import 'package:campus_flutter/main.dart';
import 'package:campus_flutter/onboardingComponent/viewModels/onboarding_viewmodel.dart';
import 'package:campus_flutter/searchComponent/viewModels/search_viewmodel.dart';
import 'package:campus_flutter/studentCardComponent/views/student_card_view.dart';
import 'package:campus_flutter/base/extensions/context.dart';
import 'package:easy_localization/easy_localization.dart';
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
          context.tr("studies"),
          style: Theme.of(context).textTheme.titleLarge,
        );
      case 2:
        return Text(
          context.tr("calendar"),
          style: Theme.of(context).textTheme.titleLarge,
        );
      case 3:
        return Text(
          context.tr("campus"),
          style: Theme.of(context).textTheme.titleLarge,
        );
      case 4:
        return Text(
          context.tr("moodle"),
          style: Theme.of(context).textTheme.titleLarge,
        );
      case 5:
        return Text(
          context.tr("places"),
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
      case 2:
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
        ref
            .read(searchViewModel(SearchType.general))
            .setSearchCategories(currentIndex);
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
        icon: const Icon(Icons.settings),
      ),
    ];
  }

  PreferredSizeWidget? bottom(BuildContext context, WidgetRef ref) {
    final message = ref.watch(hasStatusMessage);
    if (message.$1 && message.$2 != null) {
      return PreferredSize(
        preferredSize: Size(
          MediaQuery.sizeOf(context).width,
          30 + context.halfPadding,
        ),
        child: Padding(
          padding: EdgeInsets.only(bottom: context.halfPadding),
          child: Container(
            color: context.primaryColor,
            height: 30,
            width: MediaQuery.sizeOf(context).width,
            child: Center(
              child: Text(
                message.$2!.message(context),
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
                maxLines: 1,
              ),
            ),
          ),
        ),
      );
    } else {
      return null;
    }
  }

  List<NavigationDestination> bottomNavItems(BuildContext context) =>
      <NavigationDestination>[
        NavigationDestination(
          icon: const Icon(Icons.house_outlined),
          selectedIcon: const Icon(Icons.house),
          label: context.tr("home"),
        ),
        NavigationDestination(
          icon: const Icon(Icons.school_outlined),
          selectedIcon: const Icon(Icons.school),
          label: context.tr("studies"),
        ),
        NavigationDestination(
          icon: const Icon(Icons.calendar_month_outlined),
          selectedIcon: const Icon(Icons.calendar_month),
          label: context.tr("calendar"),
        ),
        NavigationDestination(
          icon: const Icon(Icons.campaign_outlined),
          selectedIcon: const Icon(Icons.campaign),
          label: context.tr("campus"),
        ),
        NavigationDestination(
          icon: Image.asset(
  'assets/images/logos/Moodle.png',
  fit: BoxFit.cover,
  height: 20,
  ),
          selectedIcon: Image.asset(
  'assets/images/logos/Moodle.png',
  fit: BoxFit.cover,
  height: 20,
  ),
          label: context.tr("moodle"),
        ),
        NavigationDestination(
          icon: const Icon(Icons.place_outlined),
          selectedIcon: const Icon(Icons.place),
          label: context.tr("places"),
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
