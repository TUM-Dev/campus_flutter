import 'package:easy_localization/easy_localization.dart';
import 'package:material_ui/material_ui.dart';

/// Keeps the title readable when larger text pushes the browse action below it.
class CampusSectionHeading extends StatelessWidget {
  const CampusSectionHeading({
    super.key,
    required this.title,
    required this.onMore,
    this.onFilter,
  });

  final String title;
  final VoidCallback onMore;
  final VoidCallback? onFilter;

  @override
  Widget build(BuildContext context) => OverflowBar(
    alignment: MainAxisAlignment.spaceBetween,
    overflowAlignment: OverflowBarAlignment.start,
    children: [
      Text(title, style: Theme.of(context).textTheme.titleLarge),
      Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (onFilter != null)
            IconButton(
              onPressed: onFilter,
              tooltip: context.tr('filter'),
              icon: const Icon(Icons.filter_list),
              visualDensity: VisualDensity.compact,
            ),
          TextButton(
            onPressed: onMore,
            child: Text(
              context.tr('more'),
              semanticsLabel: '${context.tr('more')} $title',
            ),
          ),
        ],
      ),
    ],
  );
}
