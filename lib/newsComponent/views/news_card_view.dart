import 'package:cached_network_image/cached_network_image.dart';
import 'package:campus_flutter/base/helpers/string_parser.dart';
import 'package:campus_flutter/base/networking/apis/campusBackend/campus_backend.pbgrpc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class NewsCardView extends ConsumerWidget {
  const NewsCardView({super.key, required this.news, required this.width});

  final News news;
  final double width;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
        onTap: () {
          // TODO: with RSS feed we are able to link to TUM site
        },
        child: AspectRatio(
            aspectRatio: 1.1,
            child: Card(
              margin: const EdgeInsets.symmetric(vertical: 5.0),
              child: Column(
                children: [
                  Expanded(
                      flex: 3,
                      child: ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(10.0)),
                          child: CachedNetworkImage(
                              imageUrl: kIsWeb
                                  ? news.imageUrl.toString().replaceAll(
                                      "app.tum.de", "tum-proxy.resch.io")
                                  : news.imageUrl.toString(),
                              fadeOutDuration: Duration.zero,
                              fadeInDuration: Duration.zero,
                              errorWidget: (context, string, error) => Image.asset(
                                  "assets/images/placeholders/news_placeholder.png",
                                  fit: BoxFit.fill),
                              placeholder: (context, string) => Image.asset(
                                  "assets/images/placeholders/news_placeholder.png",
                                  fit: BoxFit.fill),
                              fit: BoxFit.fill))),
                  Expanded(
                      flex: 2,
                      child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                      flex: 3,
                                      child: Text(news.title,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium
                                              ?.copyWith(
                                                  fontWeight: FontWeight.w500,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .onSurface),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis)),
                                  Expanded(
                                      child: Text(
                                          StringParser.dateFormatter(
                                              news.created.toDateTime()),
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall)),
                                  Expanded(
                                      child: Text("Source: ${news.source}",
                                          // TODO(frank): pass the source name instead of the id from the backend ^^
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis))
                                ],
                              ))))
                ],
              ),
            )));
  }
}
