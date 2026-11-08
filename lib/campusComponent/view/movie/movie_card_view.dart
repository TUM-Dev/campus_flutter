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
  Widget build(BuildContext context, WidgetRef ref) => Material(
    color:
        Theme.of(context).cardTheme.color ??
        Theme.of(context).colorScheme.surfaceContainerLow,
    borderRadius: BorderRadius.circular(12),
    clipBehavior: Clip.antiAlias,
    child: InkWell(
      onTap: () => UrlLauncher.urlString(movie.additionalInformationUrl, ref),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: CachedNetworkImage(
              imageUrl: movie.coverUrl.toString(),
              fit: BoxFit.cover,
              fadeOutDuration: Duration.zero,
              fadeInDuration: Duration.zero,
              placeholder: (context, _) => _placeholder(),
              errorWidget: (context, _, _) => _placeholder(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.movieTitle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium
                      ?.copyWith(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 4),
                Text(
                  StringParser.dateFormatter(movie.date.toDateTime(), context),
                  style: Theme.of(context).textTheme.bodySmall,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );

  Widget _placeholder() => Image.asset(
    'assets/images/placeholders/movie_placeholder.png',
    fit: BoxFit.cover,
    width: double.infinity,
  );
}
