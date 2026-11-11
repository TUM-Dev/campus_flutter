import 'package:cached_network_image/cached_network_image.dart';
import 'package:campus_flutter/base/extensions/string_capitalize.dart';
import 'package:campus_flutter/base/util/string_parser.dart';
import 'package:campus_flutter/base/networking/apis/tumdev/campus_backend.pbgrpc.dart';
import 'package:campus_flutter/base/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class NewsCardView extends ConsumerWidget {
  const NewsCardView({
    super.key,
    required this.news,
    required this.width,
    this.isCarousel = false,
  });

  final News news;
  final double width;
  final bool isCarousel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageUrl = news.imageUrl.toString().contains('src_1.png')
        ? news.link.toString()
        : news.imageUrl.toString();
    final content = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            fadeOutDuration: Duration.zero,
            fadeInDuration: Duration.zero,
            placeholder: (context, _) => _placeholder(),
            errorWidget: (context, _, _) => _placeholder(),
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                news.title.capitalizeFirstLetter(),
                style: Theme.of(context).textTheme.titleMedium
                    ?.copyWith(color: Theme.of(context).colorScheme.onSurface),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
              Text(
                '${news.sourceTitle} · ${StringParser.dateFormatter(news.date.toDateTime(), context)}',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
    return Material(
      color:
          Theme.of(context).cardTheme.color ??
          Theme.of(context).colorScheme.surfaceContainerLow,
      borderRadius: BorderRadius.circular(12),
      clipBehavior: Clip.antiAlias,
      child: isCarousel
          ? content
          : InkWell(
              onTap: imageUrl.isEmpty
                  ? null
                  : () => context.push(networkImage, extra: (imageUrl, null)),
              child: content,
            ),
    );
  }

  Widget _placeholder() => Image.asset(
    'assets/images/placeholders/news_placeholder.png',
    fit: BoxFit.cover,
    width: double.infinity,
  );
}
