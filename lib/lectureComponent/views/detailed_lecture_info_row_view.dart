import 'package:campus_flutter/base/extensions/context.dart';
import 'package:campus_flutter/base/util/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailedLectureInfoRowView extends ConsumerWidget {
  const DetailedLectureInfoRowView({
    super.key,
    required this.title,
    required this.information,
  });

  final String title;
  final String information;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.all(context.padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .titleSmall
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          Linkify(
            text: information.replaceAll(r'\\n', "\n").replaceAll(r'\t', "\t"),
            onOpen: (link) => UrlLauncher.urlString(link.url, ref),
          ),
        ],
      ),
    );
  }
}
