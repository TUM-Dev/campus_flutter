import 'package:cached_network_image/cached_network_image.dart';
import 'package:campus_flutter/newsComponent/model/news.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewsCardView extends StatelessWidget {
  const NewsCardView({super.key, required this.news});

  final (String?, News) news;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: Card(
          margin: const EdgeInsets.symmetric(vertical: 5.0),
          child: Column(
            children: [
              // TODO: placeholder image
              Expanded(
                  flex: 3,
                  child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(10.0)),
                      child: CachedNetworkImage(
                          imageUrl: news.$2.image.toString(),
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
                                  child: Text(news.$2.title,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.copyWith(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis)),
                              Expanded(
                                  child: Text(
                                      DateFormat.yMd().format(news.$2.created),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall)),
                              Expanded(
                                  child: Text("Source: ${news.$1}",
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis))
                            ],
                          ))))
            ],
          ),
        ));
  }
}
