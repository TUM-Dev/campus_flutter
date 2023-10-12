import 'package:cached_network_image/cached_network_image.dart';
import 'package:campus_flutter/base/helpers/string_parser.dart';
import 'package:campus_flutter/base/helpers/url_launcher.dart';
import 'package:campus_flutter/newsComponent/model/news.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewsCardView extends ConsumerWidget {
  const NewsCardView({super.key, required this.news, required this.width});

  final News news;
  final double width;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
        onTap: () {
          UrlLauncher.url(news.link, ref);
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
                              imageUrl:
                                  news.imageUrl.toString().contains("src_1.png")
                                      ? news.link.toString()
                                      : news.imageUrl.toString(),
                              fadeOutDuration: Duration.zero,
                              fadeInDuration: Duration.zero,
                              placeholder: (context, string) => Image.asset(
                                  "assets/images/placeholders/news_placeholder.png",
                                  fit: BoxFit.fill),
                              errorWidget: (context, url, error) => Image.asset(
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
                                              news.date, context),
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall)),
                                  /*Expanded(
                                      child: Text(
                                          context.localizations.source(news.source),
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis))*/
                                ],
                              ))))
                ],
              ),
            )));
  }
}
