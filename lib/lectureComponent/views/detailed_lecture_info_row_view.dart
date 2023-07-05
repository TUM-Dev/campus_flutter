import 'package:flutter/material.dart';

class DetailedLectureInfoRowView extends StatelessWidget {
  const DetailedLectureInfoRowView({
    super.key,
    required this.title,
    required this.information
  });

  final String title;
  final String information;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(title,
          style: Theme.of(context)
              .textTheme
              .titleSmall
              ?.copyWith(fontWeight: FontWeight.bold)),
      Text(information.replaceAll(r'\\n', "\n"))
    ]);
  }
}