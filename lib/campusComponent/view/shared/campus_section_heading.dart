import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

/// Keeps the title readable when larger text pushes the browse action below it.
class CampusSectionHeading extends StatelessWidget {
  const CampusSectionHeading({
    super.key,
    required this.title,
    required this.onMore,
  });

  final String title;
  final VoidCallback onMore;

  @override
  Widget build(BuildContext context) => OverflowBar(
    alignment: MainAxisAlignment.spaceBetween,
    overflowAlignment: OverflowBarAlignment.start,
    children: [
      Text(title, style: Theme.of(context).textTheme.titleLarge),
      TextButton(
        onPressed: onMore,
        child: Text(
          context.tr('more'),
          semanticsLabel: '${context.tr('more')} $title',
        ),
      ),
    ],
  );
}
