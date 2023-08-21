import 'package:flutter/material.dart';

class CardWithPadding extends StatelessWidget {
  final Widget child;
  final Color? color;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final double? height;

  const CardWithPadding(
      {super.key,
      required this.child,
      this.color,
      this.margin,
      this.padding,
      this.height});

  @override
  Widget build(BuildContext context) {
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
