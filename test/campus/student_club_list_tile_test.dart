import 'dart:convert';

import 'package:campus_flutter/base/networking/apis/tumdev/campus_backend.pb.dart';
import 'package:campus_flutter/campusComponent/view/studentClub/student_club_card_view.dart';
import 'package:campus_flutter/campusComponent/view/studentClub/student_club_list_tile.dart';
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

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setUpAll(() async {
    SharedPreferences.setMockInitialValues({});
    await EasyLocalization.ensureInitialized();
    _english = jsonDecode(
      await rootBundle.loadString('assets/translations/en.json'),
    ) as Map<String, dynamic>;
  });

  Future<void> pumpTile(
    WidgetTester tester,
    StudentClub club, {
    bool card = false,
    double scale = 1,
  }) async {
    await tester.pumpWidget(
      ProviderScope(
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
              home: MediaQuery(
                data: MediaQueryData(textScaler: TextScaler.linear(scale)),
                child: Scaffold(
                  body: Builder(
                    builder: (context) => card
                        ? SizedBox(
                            width: 200,
                            height: StudentClubCardView.heightFor(context),
                            child: StudentClubCardView(studentClub: club),
                          )
                        : SizedBox(
                            width: 360,
                            child: StudentClubListTile(studentClub: club),
                          ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
  }

  testWidgets('tile with a link shows its domain and a chevron', (
    tester,
  ) async {
    await pumpTile(
      tester,
      StudentClub(
        name: 'Robotics and Engineering',
        linkUrl: 'https://www.robotics.example.org/about',
      ),
    );
    expect(find.text('robotics.example.org'), findsOneWidget);
    expect(find.byIcon(Icons.chevron_right), findsOneWidget);
    expect(find.byType(InkWell), findsOneWidget);
    expect(find.text('RA'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('tile without description or link is not tappable', (
    tester,
  ) async {
    await pumpTile(tester, StudentClub(name: 'Quiet Club'));
    expect(find.text('No details or website yet'), findsOneWidget);
    expect(find.byIcon(Icons.chevron_right), findsNothing);
    expect(find.byType(InkWell), findsNothing);
    await tester.tap(find.text('Quiet Club'));
    await tester.pumpAndSettle();
    expect(find.byType(BottomSheet), findsNothing);
    expect(tester.takeException(), isNull);
  });

  testWidgets('tapping a tile opens the sheet with the full description', (
    tester,
  ) async {
    const description =
        'We build autonomous drones, meet every Tuesday and welcome '
        'students from all faculties, no prior experience needed.';
    await pumpTile(
      tester,
      StudentClub(name: 'HORYZN', description: '<p>$description</p>'),
    );
    expect(find.text('No website listed'), findsOneWidget);
    await tester.tap(find.byType(StudentClubListTile));
    await tester.pumpAndSettle();
    final sheet = find.byType(StudentClubSheet);
    expect(sheet, findsOneWidget);
    expect(
      find.descendant(of: sheet, matching: find.text(description)),
      findsOneWidget,
    );
    expect(
      find.descendant(of: sheet, matching: find.text('No website listed')),
      findsOneWidget,
    );
    expect(find.byType(FilledButton), findsNothing);
    expect(tester.takeException(), isNull);
  });

  for (final scale in [1.0, 2.0]) {
    testWidgets('campus card shows the domain and opens the sheet at $scale', (
      tester,
    ) async {
      await pumpTile(
        tester,
        StudentClub(
          name: 'Robotics and Engineering Students Association',
          linkUrl: 'https://www.robotics.example.org/about',
        ),
        card: true,
        scale: scale,
      );
      expect(find.text('robotics.example.org'), findsOneWidget);
      expect(tester.takeException(), isNull);
      await tester.tap(find.byType(StudentClubCardView));
      await tester.pumpAndSettle();
      expect(find.byType(StudentClubSheet), findsOneWidget);
      expect(find.byType(FilledButton), findsOneWidget);
      expect(tester.takeException(), isNull);
    });
  }

  testWidgets('campus card without description or link is not tappable', (
    tester,
  ) async {
    await pumpTile(tester, StudentClub(name: 'Quiet Club'), card: true);
    expect(find.byIcon(Icons.link), findsNothing);
    expect(find.byType(InkWell), findsNothing);
    await tester.tap(find.text('Quiet Club'));
    await tester.pumpAndSettle();
    expect(find.byType(BottomSheet), findsNothing);
    expect(tester.takeException(), isNull);
  });
}
