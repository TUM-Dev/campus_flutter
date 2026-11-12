import 'package:campus_flutter/base/theme/constants.dart';
import 'package:campus_flutter/base/theme/dark_theme.dart';
import 'package:campus_flutter/base/theme/legacy_package_support.dart';
import 'package:campus_flutter/base/theme/light_theme.dart';
import 'package:campus_flutter/base/util/color_picker_view.dart';
// The dependency boundary intentionally uses Flutter's legacy Material types.
import 'package:flutter/material.dart' as legacy;
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

void main() {
  for (final dark in [false, true]) {
    testWidgets('legacy color picker follows theme and locale (dark: $dark)', (
      tester,
    ) async {
      await tester.pumpWidget(
        Builder(
          builder: (context) => MaterialApp(
            theme: dark ? darkTheme(context) : lightTheme(context),
            locale: const Locale('de'),
            supportedLocales: const [Locale('en'), Locale('de')],
            localizationsDelegates: GlobalMaterialLocalizations.delegates,
            builder: (context, child) => LegacyPackageSupport(child: child!),
            home: const Scaffold(
              body: Center(
                child: ColorPickerView(
                  color: primaryLightColor,
                  onColorChanged: null,
                ),
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      await tester.tap(find.byType(ColorPickerView));
      await tester.pumpAndSettle();
      final context = tester.element(find.byType(HueRingPicker));
      expect(
        legacy.Theme.of(context).colorScheme.primary.toARGB32(),
        (dark ? primaryDarkColor : primaryLightColor).toARGB32(),
      );
      expect(
        legacy.Theme.of(context).brightness,
        dark ? Brightness.dark : Brightness.light,
      );
      expect(
        legacy.MaterialLocalizations.of(context).cancelButtonLabel,
        'Abbrechen',
      );
      expect(MaterialLocalizations.of(context).cancelButtonLabel, 'Abbrechen');
      expect(tester.takeException(), isNull);
      Navigator.of(context).pop();
      await tester.pumpAndSettle();
      expect(find.byType(HueRingPicker), findsNothing);
    });
  }
}
