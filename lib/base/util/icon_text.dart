import 'package:flutter/material.dart';

class SymbolText extends StatelessWidget {
  /// Constructor for using an IconData
  const SymbolText.icon({
    super.key,
    required IconData this.iconData,
    required this.label,
    this.style,
    this.textColor,
    this.multipleLines = false,
    this.leading = true,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.iconSize,
    this.iconColor,
    this.gap = 4.0, // Added customizable gap
  }) : image = null;

  /// Constructor for using a Widget (Image, Svg, etc.)
  const SymbolText.image({
    super.key,
    required Widget this.image,
    required this.label,
    this.style,
    this.textColor,
    this.multipleLines = false,
    this.leading = true,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.iconSize,
    this.gap = 4.0,
  }) : iconData = null,
       iconColor = null;

  final IconData? iconData;
  final Widget?
  image; // Changed from Image? to Widget? for flexibility (e.g. SVGs)
  final String label;
  final TextStyle? style;
  final Color? textColor;
  final MainAxisAlignment mainAxisAlignment;
  final bool multipleLines;
  final bool leading;
  final double? iconSize;
  final Color? iconColor;
  final double gap;

  @override
  Widget build(BuildContext context) {
    // 1. Resolve Style and Size
    final effectiveTextStyle =
        style?.copyWith(color: textColor) ?? TextStyle(color: textColor);

    // Default to the text font size if no icon size is provided, or fallback to 20
    final effectiveIconSize = iconSize ?? effectiveTextStyle.fontSize ?? 20.0;

    final effectiveIconColor = iconColor ?? effectiveTextStyle.color;

    // 2. Build the visual part (The Symbol)
    Widget? symbolWidget;

    if (iconData != null) {
      symbolWidget = Icon(
        iconData,
        color: effectiveIconColor,
        size: effectiveIconSize,
      );
    } else if (image != null) {
      // Optional: constrain image to icon size to ensure alignment
      symbolWidget = SizedBox(
        width: effectiveIconSize,
        height: effectiveIconSize,
        child: FittedBox(fit: BoxFit.contain, child: image),
      );
    }

    // 3. Build the Text Part
    Widget textWidget = Text(
      label,
      style: effectiveTextStyle,
      maxLines: multipleLines ? null : 1,
      overflow: multipleLines ? null : TextOverflow.ellipsis,
    );

    // If multiple lines, we often need Flexible, but only if inside a Row with constraints.
    // To be safe and respect the boolean:
    if (multipleLines || !multipleLines) {
      textWidget = Flexible(child: textWidget);
    }

    // 4. Construct the Children list based on leading/trailing logic
    final children = <Widget>[];

    if (leading && symbolWidget != null) {
      children.add(symbolWidget);
      children.add(SizedBox(width: gap)); // Only added if symbol exists
    }

    children.add(textWidget);

    if (!leading && symbolWidget != null) {
      children.add(SizedBox(width: gap)); // Only added if symbol exists
      children.add(symbolWidget);
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: mainAxisAlignment,
      children: children,
    );
  }
}
