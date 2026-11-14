import 'package:campus_flutter/studentCardComponent/model/student_card.dart';
import 'package:campus_flutter/studentCardComponent/views/student_card_validity_badge.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _Translations extends AssetLoader {
  @override
  Future<Map<String, dynamic>> load(String path, Locale locale) async => {
    'studentCardExpired': 'Expired',
  };
}

void main() {
  testWidgets('cached card expires before the 30-day cache window ends', (
    tester,
  ) async {
    SharedPreferences.setMockInitialValues({});
    await EasyLocalization.ensureInitialized();
    final cachedAt = DateTime(2026, 11, 1);
    final expiresAt = cachedAt.add(const Duration(days: 20));
    var now = expiresAt.subtract(const Duration(seconds: 1));
    // The same card stays in memory throughout; there is no refresh or fetch.
    final card = StudentCard(
      id: 'demo',
      name: 'Demo',
      birthday: DateTime(2000),
      studyID: 'demo',
      chipID: 'demo',
      semester: '26W',
      validFrom: cachedAt,
      validUntil: expiresAt,
      studies: [],
      image: '',
    );
    await tester.pumpWidget(
      EasyLocalization(
        supportedLocales: const [Locale('en')],
        startLocale: const Locale('en'),
        saveLocale: false,
        path: 'unused',
        assetLoader: _Translations(),
        child: Builder(
          builder: (context) => MaterialApp(
            locale: context.locale,
            supportedLocales: context.supportedLocales,
            localizationsDelegates: context.localizationDelegates,
            home: Scaffold(
              body: Row(
                children: [
                  StudentCardValidityBadge(studentCard: card, now: () => now),
                ],
              ),
            ),
          ),
        ),
      ),
    );
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));
    expect(find.text('VALID'), findsOneWidget);

    now = expiresAt.add(const Duration(seconds: 1));
    expect(now.isBefore(cachedAt.add(const Duration(days: 30))), isTrue);
    await tester.pump(const Duration(seconds: 1));
    expect(find.text('VALID'), findsNothing);
    expect(find.text('Expired'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
