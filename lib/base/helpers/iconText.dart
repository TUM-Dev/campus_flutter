import 'package:flutter/material.dart';

class IconText extends StatelessWidget {
  const IconText({
    super.key,
    required this.iconData,
    required this.label,
    this.style,
    this.textColor,
    this.multipleLines = false,
    this.leadingIcon = true
  });

  final IconData iconData;
  final String label;
  final TextStyle? style;
  final Color? textColor;
  final bool multipleLines;
  final bool leadingIcon;

  @override
  Widget build(BuildContext context) {
    var textStyle = style ?? TextStyle(color: textColor);
    var iconColor = style?.color ?? Theme.of(context).primaryColor;
    var iconSize = style != null ? style?.fontSize : 20.0;
    if (leadingIcon) {
      return Row(
        children: [
          Icon(iconData, color: iconColor, size: iconSize),
          const Padding(padding: EdgeInsets.symmetric(horizontal: 4.0)),
          multipleLines
              ? Expanded(child: Text(label, style: textStyle))
              : Text(label, style: textStyle, maxLines: 1)
        ],
      );
    } else {
      return Row(
        children: [
          multipleLines
              ? Expanded(child: Text(label, style: textStyle))
              : Text(label, style: textStyle, maxLines: 1),
          const Padding(padding: EdgeInsets.symmetric(horizontal: 4.0)),
          Icon(iconData, color: iconColor, size: iconSize),
        ],
      );
    }
  }
}