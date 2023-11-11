import 'package:campus_flutter/base/extensions/context.dart';
import 'package:flutter/material.dart';

class DetailedLectureInfoRowView extends StatelessWidget {
  const DetailedLectureInfoRowView({
    super.key,
    required this.title,
    required this.information,
  });

  final String title;
  final String information;

  @override
  Widget build(BuildContext context) {
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
          Text(information.replaceAll(r'\\n', "\n")),
        ],
      ),
    );
  }
}
