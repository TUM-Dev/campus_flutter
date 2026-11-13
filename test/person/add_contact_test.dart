import 'dart:async';

import 'package:campus_flutter/base/enums/gender.dart';
import 'package:campus_flutter/personComponent/model/personDetails/person_details.dart';
import 'package:campus_flutter/personComponent/viewModel/person_details_viewmodel.dart';
import 'package:campus_flutter/personComponent/views/person_details_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helpers/localized_test_app.dart';

class _PersonModel extends PersonDetailsViewModel {
  _PersonModel(PersonDetails person) : super('staff*1') {
    personDetails.add(person);
  }

  @override
  Future<void> fetch(bool forcedRefresh) async {}
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setUpAll(() async {
    SharedPreferences.setMockInitialValues({});
    await EasyLocalization.ensureInitialized();
  });

  late _PersonModel model;
  setUp(() {
    model = _PersonModel(
      PersonDetails(
        nr: '1',
        obfuscatedID: 'staff*1',
        firstName: 'Test',
        name: 'Person',
        email: 'test@example.com',
        gender: Gender.unknown,
        organisations: [],
        rooms: [],
        phoneExtensions: [],
      ),
    );
  });
  tearDown(() async {
    await model.personDetails.close();
    await model.lastFetched.close();
  });

  Future<void> open(
    WidgetTester tester,
    Future<String?> Function({Contact? contact}) create,
  ) async {
    await pumpCard(
      tester,
      ProviderScope(
        overrides: [
          personDetailsViewModel('staff*1').overrideWith((ref) => model),
          contactCreatorProvider.overrideWithValue(create),
        ],
        child: const SizedBox(
          height: 650,
          child: PersonDetailsView(obfuscatedId: 'staff*1'),
        ),
      ),
    );
  }

  testWidgets(
    'system creator is prefilled and duplicate submissions are blocked',
    (tester) async {
      final pending = Completer<String?>();
      final requests = <Contact?>[];
      await open(tester, ({Contact? contact}) {
        requests.add(contact);
        return pending.future;
      });
      final button = find.widgetWithText(ElevatedButton, 'add_contact');
      await tester.tap(button);
      await tester.pump();
      expect(requests.single?.name?.first, 'Test');
      expect(requests.single?.name?.last, 'Person');
      expect(requests.single?.emails.single.address, 'test@example.com');
      expect(tester.widget<ElevatedButton>(button).onPressed, isNull);
      expect(requests, hasLength(1));
      // Cancellation is a normal outcome and allows trying again.
      pending.complete(null);
      await tester.pumpAndSettle();
      expect(tester.widget<ElevatedButton>(button).onPressed, isNotNull);
      expect(find.byType(SnackBar), findsNothing);
      expect(tester.takeException(), isNull);
    },
  );

  testWidgets('native editor failure is shown and does not escape the action', (
    tester,
  ) async {
    await open(tester, ({Contact? contact}) async {
      throw PlatformException(code: 'not_available', message: 'No contact app');
    });
    final button = find.widgetWithText(ElevatedButton, 'add_contact');
    await tester.tap(button);
    await tester.pumpAndSettle();
    expect(find.byType(SnackBar), findsOneWidget);
    expect(tester.widget<ElevatedButton>(button).onPressed, isNotNull);
    expect(tester.takeException(), isNull);
  });

  testWidgets('returning from the editor after leaving the view is safe', (
    tester,
  ) async {
    final pending = Completer<String?>();
    await open(tester, ({Contact? contact}) => pending.future);
    await tester.tap(find.widgetWithText(ElevatedButton, 'add_contact'));
    await tester.pumpWidget(const SizedBox());
    pending.complete('created-contact');
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);
  });
}
