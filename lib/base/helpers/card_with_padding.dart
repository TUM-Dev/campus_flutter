import 'package:flutter/material.dart';

class CardWithPadding extends StatelessWidget {
  final Widget child;
  final Color? color;
  final EdgeInsetsGeometry? margin;
  final double? height;

  const CardWithPadding(
      {super.key, required this.child, this.color, this.margin, this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height,
        child: Card(
          margin: margin,
          color: color,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: child,
          ),
        ));
  }
}
