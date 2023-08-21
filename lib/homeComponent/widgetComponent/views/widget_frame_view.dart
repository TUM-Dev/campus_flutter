import 'package:campus_flutter/theme.dart';
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
            padding: EdgeInsets.symmetric(
                horizontal: context.padding, vertical: context.halfPadding),
            child: Text(title!,
                style: Theme.of(context).textTheme.titleMedium,
                maxLines: 1,
                overflow: TextOverflow.ellipsis)),
      if (subtitle != null) subtitle!,
      child,
      Padding(padding: EdgeInsets.symmetric(vertical: context.halfPadding))
    ]);
  }
}
