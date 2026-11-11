import 'dart:convert';

import 'package:campus_flutter/base/networking/apis/tumdev/campus_backend.pb.dart';
import 'package:campus_flutter/campusComponent/screen/student_clubs_screen.dart';
import 'package:campus_flutter/campusComponent/view/studentClub/student_club_list_tile.dart';
import 'package:campus_flutter/campusComponent/viewmodel/student_club_viewmodel.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

late Map<String, dynamic> _english;

class _Translations extends AssetLoader {
  const _Translations();
  @override
  Future<Map<String, dynamic>> load(String path, Locale locale) async =>
      _english;
}

class _Clubs extends StudentClubViewModel {
  @override
  Future<void> fetchStudentClubs(
    bool forceRefresh,
    BuildContext context,
  ) async {
    collections.add([
      StudentClubCollection(
        title: 'Music',
        clubs: [
          StudentClub(
            name: 'Student Music Initiative',
            description: 'Choir and orchestra',
            linkUrl: 'https://music.example.org',
          ),
          StudentClub(name: 'Jazz Band'),
        ],
      ),
      StudentClubCollection(
        title: 'Technology',
        clubs: [
          StudentClub(
            name: 'Robotics and Engineering',
            linkUrl: 'https://robotics.example.org',
          ),
          StudentClub(name: 'Rocket Team', description: 'We build rockets'),
        ],
      ),
    ]);
  }
}

const _allClubs = [
  'Student Music Initiative',
  'Jazz Band',
  'Robotics and Engineering',
  'Rocket Team',
];

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setUpAll(() async {
    SharedPreferences.setMockInitialValues({});
    await EasyLocalization.ensureInitialized();
    _english = jsonDecode(
      await rootBundle.loadString('assets/translations/en.json'),
    ) as Map<String, dynamic>;
  });

  Future<void> pumpScreen(
    WidgetTester tester, {
    Size size = const Size(800, 1400),
  }) async {
    tester.view.physicalSize = size;
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    final clubs = _Clubs();
    addTearDown(() async {
      await clubs.collections.close();
      await clubs.suggestions.close();
    });
    await tester.pumpWidget(
      ProviderScope(
        overrides: [studentClubViewModel.overrideWithValue(clubs)],
        child: EasyLocalization(
          supportedLocales: const [Locale('en')],
          startLocale: const Locale('en'),
          saveLocale: false,
          path: 'unused',
          assetLoader: const _Translations(),
          child: Builder(
            builder: (context) => MaterialApp(
              locale: context.locale,
              supportedLocales: context.supportedLocales,
              localizationsDelegates: context.localizationDelegates,
              home: const StudentClubsScreen(),
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
  }

  void expectClubs(List<String> visible) {
    for (final name in _allClubs) {
      expect(
        find.text(name),
        visible.contains(name) ? findsOneWidget : findsNothing,
        reason: name,
      );
    }
  }

  testWidgets('all clubs are grouped under category headings', (tester) async {
    await pumpScreen(tester);
    expect(find.byType(TabBar), findsNothing);
    expect(find.text('Music'), findsOneWidget);
    expect(find.text('Technology'), findsOneWidget);
    expect(find.text('2'), findsNWidgets(2));
    expectClubs(_allClubs);
    expect(tester.takeException(), isNull);
  });

  testWidgets('rows fit their content and the filters stay pinned', (
    tester,
  ) async {
    await pumpScreen(tester, size: const Size(400, 500));
    double rowHeight(String name) =>
        tester.getSize(find.widgetWithText(StudentClubListTile, name)).height;
    expect(
      rowHeight('Jazz Band'),
      lessThan(rowHeight('Student Music Initiative')),
    );

    final search = tester.getTopLeft(find.byType(TextField));
    final heading = tester.getTopLeft(find.text('Music')).dy;
    await tester.drag(find.text('Jazz Band'), const Offset(0, -150));
    await tester.pumpAndSettle();
    expect(tester.getTopLeft(find.text('Music')).dy, lessThan(heading));
    expect(find.text('Music').hitTestable(), findsNothing);
    expect(tester.getTopLeft(find.byType(TextField)), search);
    expect(find.text('Has website').hitTestable(), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('the category sheet switches categories', (tester) async {
    await pumpScreen(tester);
    await tester.tap(find.text('All categories'));
    await tester.pumpAndSettle();
    final options = find.byType(ListTile);
    expect(options, findsNWidgets(3));
    expect(
      find.descendant(of: options.first, matching: find.text('4')),
      findsOneWidget,
    );
    await tester.tap(
      find.descendant(of: options, matching: find.text('Music')),
    );
    await tester.pumpAndSettle();
    expect(find.byType(ListTile), findsNothing);
    expectClubs(['Student Music Initiative', 'Jazz Band']);

    await tester.tap(find.byType(FilterChip).first);
    await tester.pumpAndSettle();
    await tester.tap(
      find.descendant(
        of: find.byType(ListTile),
        matching: find.text('All categories'),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('All categories'), findsOneWidget);
    expectClubs(_allClubs);
    expect(tester.takeException(), isNull);
  });

  testWidgets('search and the website filter narrow the list', (tester) async {
    await pumpScreen(tester);
    await tester.enterText(find.byType(TextField), 'ROCKET');
    await tester.pumpAndSettle();
    expectClubs(['Rocket Team']);
    expect(find.text('Music'), findsNothing);

    await tester.enterText(find.byType(TextField), 'orchestra');
    await tester.pumpAndSettle();
    expectClubs(['Student Music Initiative']);

    await tester.enterText(find.byType(TextField), '');
    await tester.tap(find.text('Has website'));
    await tester.pumpAndSettle();
    expectClubs(['Student Music Initiative', 'Robotics and Engineering']);

    await tester.enterText(find.byType(TextField), 'zzz');
    await tester.pumpAndSettle();
    expect(find.text('No clubs match your filters'), findsOneWidget);
    await tester.tap(find.text('Clear filters'));
    await tester.pumpAndSettle();
    expectClubs(_allClubs);
    expect(
      tester.widget<TextField>(find.byType(TextField)).controller!.text,
      isEmpty,
    );
    expect(tester.takeException(), isNull);
  });
}
