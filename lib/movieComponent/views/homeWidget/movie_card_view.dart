import 'package:campus_flutter/base/helpers/string_parser.dart';
import 'package:campus_flutter/base/helpers/url_launcher.dart';
import 'package:campus_flutter/movieComponent/model/movie.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieCardView extends ConsumerWidget {
  const MovieCardView({super.key, required this.movie, required this.width});

  final Movie movie;
  final double width;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
        onTap: () {
          UrlLauncher.url(movie.link, ref);
        },
        child: Card(
            margin: const EdgeInsets.all(0),
            child: AspectRatio(
                aspectRatio: 250 / 470,
                child: Column(children: [
                  Expanded(
                      flex: 8,
                      child: ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(10)),
                          child: CachedNetworkImage(
                            imageUrl: kIsWeb
                                ? movie.cover.toString().replaceAll(
                                    "app.tum.de", "tum-proxy.resch.io")
                                : movie.cover.toString(),
                            fit: BoxFit.fitWidth,
                            fadeOutDuration: Duration.zero,
                            fadeInDuration: Duration.zero,
                            placeholder: (context, string) {
                              return Image.asset(
                                  "assets/images/placeholders/movie_placeholder.png",
                                  fit: BoxFit.cover);
                            },
                          ))),
                  Expanded(
                      flex: 2,
                      child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: SizedBox(
                              width: double.infinity,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                        child: Text(movie.title,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium
                                                ?.copyWith(
                                                    fontWeight:
                                                        FontWeight.w500))),
                                    Expanded(
                                        child: Text(
                                            StringParser.dateFormatter(
                                                movie.date, context),
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis))
                                  ]))))
                ]))));
  }
}
