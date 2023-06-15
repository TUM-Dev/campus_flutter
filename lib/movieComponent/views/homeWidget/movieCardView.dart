import 'package:campus_flutter/movieComponent/model/movie.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MovieCardView extends StatelessWidget {
  const MovieCardView({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final sizes = MediaQuery.of(context).size;
    return Card(
        margin: const EdgeInsets.all(0),
        child: SizedBox(
            width: sizes.width * 0.4,
            child: Column(children: [
              ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                  child: CachedNetworkImage(
                      imageUrl: movie.cover.toString(),
                      fit: BoxFit.fitWidth,
                      fadeOutDuration: Duration.zero,
                      fadeInDuration: Duration.zero,
                      placeholder: (context, string) {
                        return Image.asset("assets/images/movie_placeholder.png", fit: BoxFit.cover);
                      },
                  )
              ),
              Flexible(
                  child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(child: Text(
                                movie.title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis
                            )),
                            Flexible(child: Text(
                                DateFormat.yMd().format(movie.date),
                                style: Theme.of(context).textTheme.labelMedium,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis
                            ))
                          ]
                      )
                  )
              )
            ])));
  }
}