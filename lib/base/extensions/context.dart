import 'package:material_ui/material_ui.dart';

extension ContextTheme on BuildContext {
  ThemeData get theme => Theme.of(this);

  double get halfPadding => 5.0;

  double get padding => 15.0;

  Color get primaryColor => Theme.of(this).primaryColor;
}
