import 'package:campus_flutter/base/util/color_picker_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  for (final size in [const Size(400, 800), const Size(800, 600)]) {
    testWidgets(
      'hex editing tolerates partial input and preserves valid colors ($size)',
      (tester) async {
        tester.view.physicalSize = size;
        tester.view.devicePixelRatio = 1;
        addTearDown(tester.view.reset);
        final changes = <Color>[];
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Center(
                child: ColorPickerView(
                  color: Colors.blue,
                  onColorChanged: changes.add,
                ),
              ),
            ),
          ),
        );
        await tester.tap(find.byType(ColorPickerView));
        await tester.pumpAndSettle();

        final field = find.byType(TextField);
        for (final input in ['#', '#C', '#C92FA', '']) {
          await tester.enterText(field, input);
          await tester.pump();
          expect(tester.takeException(), isNull, reason: 'Input: $input');
        }
        expect(changes, isEmpty);

        await tester.enterText(field, '#C92FAB');
        await tester.pump();
        expect(changes.last, const Color(0xFFC92FAB));
        final count = changes.length;

        await tester.enterText(field, '#C92FA');
        await tester.pump();
        expect(changes.length, count);
        expect(changes.last, const Color(0xFFC92FAB));
        expect(tester.takeException(), isNull);

        await tester.enterText(field, '#ABC');
        await tester.pump();
        expect(changes.last, const Color(0xFFAABBCC));
        expect(tester.takeException(), isNull);
      },
    );
  }
}
