import 'package:flutter/material.dart';

class PlaceholderText extends StatelessWidget {
  const PlaceholderText({super.key, required this.text, this.style});

  final String text;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    var textSize = _calcTextSize();
    return Container(
      height: textSize.height,
      width: textSize.width,
      color: Colors.grey,
      // TODO: rounded corners?
    );
  }

  /// found on: https://stackoverflow.com/a/63133637
  Size _calcTextSize() {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      textDirection: TextDirection.ltr,
      textScaleFactor: WidgetsBinding.instance.window.textScaleFactor,
    )..layout();
    return textPainter.size;
  }
}
