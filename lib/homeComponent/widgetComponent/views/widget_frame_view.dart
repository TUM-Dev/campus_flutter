import 'package:flutter/material.dart';

class WidgetFrameView extends StatelessWidget {
  const WidgetFrameView(
      {super.key, this.title, this.subtitle, required this.child});

  final String? title;
  final Widget? subtitle;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      if (title != null)
        Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: Text(title!,
                style: Theme.of(context).textTheme.titleMedium,
                maxLines: 1,
                overflow: TextOverflow.ellipsis)),
      if (subtitle != null) subtitle!,
      child,
      const Padding(padding: EdgeInsets.symmetric(vertical: 5.0))
    ]);
  }
}
