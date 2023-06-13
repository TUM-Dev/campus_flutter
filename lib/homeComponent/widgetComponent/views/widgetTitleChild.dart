import 'package:flutter/material.dart';

class WidgetTitleChild extends StatelessWidget {
  const WidgetTitleChild({super.key, required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          child: Text(title, style: Theme.of(context).textTheme.titleMedium)),
      child
    ]);
  }
}
