import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension ContextTheme on BuildContext {
  ThemeData get theme => Theme.of(this);

  double get halfPadding => 5.0;

  double get padding => 15.0;

  Color get primaryColor => Theme.of(this).primaryColor;
}

extension Localization on BuildContext {
  AppLocalizations get localizations => AppLocalizations.of(this)!;
}
