import 'package:campus_flutter/base/enums/campus.dart';
import 'package:campus_flutter/base/extensions/context.dart';
import 'package:campus_flutter/base/providers/default_campus_provider.dart';
import 'package:campus_flutter/base/routing/routes.dart' as routes;
import 'package:campus_flutter/settingsComponent/views/default_campus_options.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

class CampusCardView extends ConsumerWidget {
  const CampusCardView({
    super.key,
    required this.campus,
    this.margin = EdgeInsets.zero,
  });

  final Campus campus;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDefault = ref.watch(defaultCampusProvider) == campus;
    final theme = Theme.of(context);
    final label = defaultCampusLabel(context, campus);

    return Card(
      margin: margin,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => context.push(routes.place, extra: campus),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    campus.image,
                    fit: BoxFit.cover,
                    cacheWidth: 600,
                    excludeFromSemantics: true,
                  ),
                  if (isDefault)
                    Positioned(
                      top: 8,
                      right: 8,
                      child: Tooltip(
                        message: context.tr('defaultCampus'),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.surface.withValues(
                              alpha: 0.9,
                            ),
                            borderRadius: BorderRadius.circular(999),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.push_pin,
                                size: 12,
                                color: context.primaryColor,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                context.tr('defaultCampus'),
                                style: theme.textTheme.labelSmall?.copyWith(
                                  color: context.primaryColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: SizedBox(
                height: 36,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    label,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: context.primaryColor,
                      fontWeight: FontWeight.w600,
                      height: 1.2,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
