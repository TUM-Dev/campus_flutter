import 'package:flutter/material.dart';

class PlaceholderText extends StatelessWidget {
  const PlaceholderText({super.key, required this.text, this.style});

  final String text;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    var textSize = _calcTextSize(context);
    return Container(
      height: textSize.height,
      width: textSize.width,
      color: Colors.grey,
    );
  }

  /// found on: https://stackoverflow.com/a/63133637
  Size _calcTextSize(BuildContext context) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      textDirection: TextDirection.ltr,
      textScaler: MediaQuery.textScalerOf(context),
    )..layout();
    return textPainter.size;
  }
}
