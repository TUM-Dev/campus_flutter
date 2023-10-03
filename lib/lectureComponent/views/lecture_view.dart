import 'package:campus_flutter/base/helpers/icon_text.dart';
import 'package:campus_flutter/lectureComponent/model/lecture.dart';
import 'package:campus_flutter/lectureComponent/views/lecture_details_view.dart';
import 'package:campus_flutter/providers_get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LectureView extends ConsumerWidget {
  const LectureView({super.key, required this.lecture, this.isSearch = false});

  final Lecture lecture;
  final bool isSearch;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      title: Text(lecture.title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 15),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            Expanded(
                child: IconText(
              iconData: Icons.edit,
              label: lecture.eventType(context),
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: Theme.of(context).colorScheme.secondary),
              iconColor: Theme.of(context).primaryColor,
              multipleLines: true,
            )),
            Expanded(
                child: IconText(
                    iconData: Icons.access_time,
                    label: lecture.sws,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.secondary),
                    iconColor: Theme.of(context).primaryColor)),
          ]),
          const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          if (lecture.speaker != null)
            IconText(
              iconData: Icons.person,
              label: lecture.speaker!,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: Theme.of(context).colorScheme.secondary),
              iconColor: Theme.of(context).primaryColor,
              multipleLines: true,
            ),
        ],
      ),
      onTap: () {
        if (MediaQuery.orientationOf(context) == Orientation.portrait ||
            isSearch) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Scaffold(
                      appBar: AppBar(leading: const BackButton()),
                      body: LectureDetailsView(
                        lecture: lecture,
                      ))));
        } else {
          ref.read(lectureSplitViewModel).selectedWidget.add(LectureDetailsView(
                key: Key(lecture.title),
                lecture: lecture,
              ));
        }
      },
    );
  }
}