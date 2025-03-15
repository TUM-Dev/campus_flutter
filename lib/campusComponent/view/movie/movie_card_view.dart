import 'package:campus_flutter/base/util/string_parser.dart';
import 'package:campus_flutter/base/util/url_launcher.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:campus_flutter/base/networking/apis/tumdev/campus_backend.pbgrpc.dart';
import 'package:campus_flutter/campusComponent/viewmodel/movies_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieCardView extends ConsumerWidget {
  const MovieCardView({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {
        UrlLauncher.urlString(movie.additionalInformationUrl, ref);
      },
      child: body(context),
    );
  }

  Widget body(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardTheme.color,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      clipBehavior: Clip.antiAlias,
      child: AspectRatio(
        aspectRatio: 250 / 470,
        child: Column(
          children: [
            Expanded(
              flex: 8,
              child: CachedNetworkImage(
                imageUrl: movie.coverUrl.toString(),
                fit: BoxFit.fill,
                height: double.infinity,
                width: double.infinity,
                fadeOutDuration: Duration.zero,
                fadeInDuration: Duration.zero,
                placeholder:
                    (context, string) => Image.asset(
                      "assets/images/placeholders/movie_placeholder.png",
                      fit: BoxFit.fill,
                      height: double.infinity,
                      width: double.infinity,
                    ),
                errorWidget:
                    (context, url, error) => Image.asset(
                      "assets/images/placeholders/movie_placeholder.png",
                      fit: BoxFit.fill,
                      height: double.infinity,
                      width: double.infinity,
                    ),
              ),
            ),
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
                        child: Text(
                          movie.movieTitle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(fontWeight: FontWeight.w500),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          StringParser.dateFormatter(
                            movie.date.toDateTime(),
                            context,
                          ),
                          style: Theme.of(context).textTheme.bodySmall,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
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
    );
  }
}
