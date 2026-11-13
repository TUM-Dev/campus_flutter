import 'package:campus_flutter/dev/student_card_preview.dart' as preview;
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  testWidgets(
    'synthetic preview shows invalid states and preserves the valid animation',
    (tester) async {
      SharedPreferences.setMockInitialValues({});
      tester.view.physicalSize = const Size(390, 844);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.reset);
      await preview.main();
      await tester.pumpAndSettle();
      expect(find.text('Expired'), findsOneWidget);
      expect(find.text('VALID'), findsNothing);
      expect(tester.takeException(), isNull);

      for (final scenario in [
        ('current', 'VALID'),
        ('notYetValid', 'Not yet valid'),
        ('invalid', 'Invalid validity dates'),
      ]) {
        final selected = scenario.$1 == 'current'
            ? 'expired'
            : scenario.$1 == 'notYetValid'
            ? 'current'
            : 'notYetValid';
        await tester.tap(find.text(selected).first);
        await tester.pump(const Duration(milliseconds: 300));
        await tester.tap(find.text(scenario.$1).last);
        await tester.pump(const Duration(milliseconds: 300));
        expect(find.text(scenario.$2), findsOneWidget);
        if (scenario.$1 != 'current') expect(find.text('VALID'), findsNothing);
        expect(tester.takeException(), isNull);
      }
    },
  );
}
