import 'package:cached_network_image/cached_network_image.dart';
import 'package:campus_flutter/base/util/string_parser.dart';
import 'package:campus_flutter/base/util/url_launcher.dart';
import 'package:campus_flutter/campusComponent/model/campus_event.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

class EventCardView extends ConsumerWidget {
  const EventCardView({super.key, required this.event, this.compact = false});

  final CampusEvent event;

  /// true  = carousel widget (image fills remaining height via Expanded)
  /// false = full-screen grid (image fixed at 120 px)
  final bool compact;

  static const _tumBlue = Color(0xFF0065BD);
  static const _darkViolet = Color(0xFF3D1A6E);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sourceLabel = event.source == CampusEventSource.university
        ? context.tr('eventSourceUniversity')
        : context.tr('eventSourceStudentCouncil');

    // University events: image + text layout
    if (event.coverUrl != null) {
      final image = CachedNetworkImage(
        imageUrl: event.coverUrl!,
        width: double.infinity,
        fit: BoxFit.cover,
        fadeOutDuration: Duration.zero,
        fadeInDuration: Duration.zero,
        errorWidget: (context, url, error) => const SizedBox.shrink(),
      );
      return Material(
        color:
            Theme.of(context).cardTheme.color ??
            Theme.of(context).colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(12),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () => UrlLauncher.urlString(event.link, ref),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              compact
                  ? Expanded(child: image)
                  : SizedBox(height: 120, child: image),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _sourceChip(context, sourceLabel),
                    const SizedBox(height: 4),
                    Text(
                      event.title,
                      style: Theme.of(context).textTheme.titleMedium,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (event.eventDate != null) ...[
                      const SizedBox(height: 4),
                      Text(
                        StringParser.dateFormatter(event.eventDate!, context),
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                    if (event.description != null) ...[
                      const SizedBox(height: 4),
                      Text(
                        event.description!,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

    // Student council events: compact list card
    return Card(
      margin: EdgeInsets.zero,
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () => UrlLauncher.urlString(event.link, ref),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _sourceChip(context, sourceLabel),
              const SizedBox(height: 4),
              Text(
                event.title,
                style: Theme.of(context).textTheme.bodyMedium
                    ?.copyWith(fontWeight: FontWeight.w600),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              if (event.eventDate != null)
                Text(
                  StringParser.dateFormatter(event.eventDate!, context),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              if (event.time != null)
                Text(
                  event.time!,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              if (event.location != null)
                Text(
                  event.location!,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _sourceChip(BuildContext context, String label) {
    final bg = event.source == CampusEventSource.university
        ? _tumBlue
        : _darkViolet;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.labelSmall
            ?.copyWith(color: Colors.white),
      ),
    );
  }
}
