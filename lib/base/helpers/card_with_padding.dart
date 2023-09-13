import 'package:flutter/material.dart';

class CardWithPadding extends StatelessWidget {
  final Widget child;
  final Color? color;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final double? height;
  final BoxConstraints? boxConstraints;

  const CardWithPadding(
      {super.key,
      required this.child,
      this.color,
      this.margin,
      this.padding,
      this.height,
      this.boxConstraints});

  const CardWithPadding.fixed(
      {super.key,
      required this.child,
      this.color,
      this.margin,
      this.padding,
      required this.height,
      this.boxConstraints});

  const CardWithPadding.constrained(
      {super.key,
      required this.child,
      this.color,
      this.margin,
      this.padding,
      this.height,
      required this.boxConstraints});

  @override
  Widget build(BuildContext context) {
    if (boxConstraints != null) {
      return ConstrainedBox(
          constraints: boxConstraints!,
          child: Card(
            margin: margin,
            color: color,
            child: Padding(
              padding: padding ?? const EdgeInsets.all(10.0),
              child: child,
            ),
          ));
    } else {
      return SizedBox(
          height: height,
          child: Card(
            margin: margin,
            color: color,
            child: Padding(
              padding: padding ?? const EdgeInsets.all(10.0),
              child: child,
            ),
          ));
    }
  }
}
