import 'package:cached_network_image/cached_network_image.dart';
import 'package:campus_flutter/base/helpers/string_parser.dart';
import 'package:campus_flutter/newsComponent/model/news.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NewsCardView extends ConsumerWidget {
  const NewsCardView({super.key, required this.news, required this.width});

  final (String?, News) news;
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
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(10.0)),
                      child: CachedNetworkImage(
                          imageUrl: kIsWeb
                              ? news.$2.image.toString()
                              .replaceAll("app.tum.de", "tum-proxy.resch.io")
                              : news.$2.image.toString(),
                          fadeOutDuration: Duration.zero,
                          fadeInDuration: Duration.zero,
                          placeholder: (context, string) => Image.asset("assets/images/placeholders/news_placeholder.png", fit: BoxFit.fill),
                          fit: BoxFit.fill
                      ))),
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
                                  child: Text(news.$2.title,
                                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                          fontWeight: FontWeight.w500,
                                          color: Theme.of(context).colorScheme.onSurface),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis)),
                              Expanded(
                                  child: Text(StringParser.dateFormatter(news.$2.created),
                                      style: Theme.of(context).textTheme.bodySmall)),
                              Expanded(
                                  child: Text(AppLocalizations.of(context)!.source(news.$1),
                                      style: Theme.of(context).textTheme.bodySmall,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis))
                            ],
                          ))))
            ],
          ),
        )));
  }
}
