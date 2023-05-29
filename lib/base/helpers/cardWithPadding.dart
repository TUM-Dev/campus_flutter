import 'package:flutter/material.dart';

class CardWithPadding extends StatelessWidget {
  final Widget child;
  final Color? color;

  const CardWithPadding({super.key, required this.child, this.color});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: child,
      ),
    );
  }
}