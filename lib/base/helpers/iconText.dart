import 'package:flutter/material.dart';

class IconText extends StatelessWidget {
  const IconText({super.key, required this.iconData, required this.label, this.style});

  final IconData iconData;
  final String label;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        style != null
            ? Icon(iconData, color: style!.color, size: style!.fontSize!+2.0)
            : Icon(iconData),
        const Padding(padding: EdgeInsets.symmetric(horizontal: 4.0)),
        Text(label, style: style)
      ],
    );
  }
}