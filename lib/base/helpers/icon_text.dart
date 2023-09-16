import 'package:flutter/material.dart';

class IconText extends StatelessWidget {
  const IconText(
      {super.key,
      required this.iconData,
      required this.label,
      this.style,
      this.textColor,
      this.multipleLines = false,
      this.leadingIcon = true,
      this.mainAxisAlignment = MainAxisAlignment.start,
      this.iconSize,
      this.iconColor});

  final IconData iconData;
  final String label;
  final TextStyle? style;
  final Color? textColor;
  final MainAxisAlignment mainAxisAlignment;
  final bool multipleLines;
  final bool leadingIcon;
  final double? iconSize;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    var textStyle = style ?? TextStyle(color: textColor);
    var iconColor = this.iconColor ?? style?.color;
    var iconSize =
        this.iconSize ?? (style?.fontSize != null ? style!.fontSize : 20.0);
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: mainAxisAlignment,
      children: [
        if (leadingIcon) ...[
          Icon(iconData, color: iconColor, size: iconSize),
          const Padding(padding: EdgeInsets.symmetric(horizontal: 4.0)),
          multipleLines
              ? Flexible(child: Text(label, style: textStyle))
              : Flexible(child: Text(label, style: textStyle, maxLines: 1))
        ],
        if (!leadingIcon) ...[
          multipleLines
              ? Flexible(child: Text(label, style: textStyle))
              : Flexible(
                  child: Text(label,
                      style: textStyle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis)),
          const Padding(padding: EdgeInsets.symmetric(horizontal: 4.0)),
          Icon(iconData, color: iconColor, size: iconSize)
        ]
      ],
    );
  }
}
