import 'package:material_ui/material_ui.dart';

/// Keeps packages that still use flutter/material.dart on the app's theme.
/// Remove once flutter_colorpicker and flutter_linkify migrate to material_ui.
class LegacyPackageSupport extends StatelessWidget {
  const LegacyPackageSupport({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    // This temporary upstream utility is needed for the remaining legacy packages.
    // ignore: deprecated_member_use
    return MaterialUiCompatibilityBridge(child: child);
  }
}
