import 'package:campus_flutter/base/util/string_parser.dart';
import 'package:campus_flutter/base/util/url_launcher.dart';
import 'package:campus_flutter/campusComponent/model/campus_event.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

class EventCardView extends ConsumerWidget {
  const EventCardView({super.key, required this.event});

  final CampusEvent event;

  @override
  Widget build(BuildContext context, WidgetRef ref) => Card(
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
            Text(
              event.title,
              style: Theme.of(context).textTheme.bodyMedium
                  ?.copyWith(fontWeight: FontWeight.w600),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            if (event.eventDate != null)
              Text(
                StringParser.dateFormatter(event.eventDate!, context),
                style: Theme.of(context).textTheme.bodySmall,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            if (event.time != null)
              Text(
                event.time!,
                style: Theme.of(context).textTheme.bodySmall,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            if (event.location != null)
              Text(
                event.location!,
                style: Theme.of(context).textTheme.bodySmall,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
          ],
        ),
      ),
    ),
  );
}
