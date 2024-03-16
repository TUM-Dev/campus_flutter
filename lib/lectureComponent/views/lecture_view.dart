import 'package:campus_flutter/base/util/icon_text.dart';
import 'package:campus_flutter/base/routing/routes.dart';
import 'package:campus_flutter/homeComponent/split_view_viewmodel.dart';
import 'package:campus_flutter/lectureComponent/model/lecture.dart';
import 'package:campus_flutter/lectureComponent/views/lecture_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

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
          const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          Row(
            children: [
              Expanded(
                child:
                    _subtitle(lecture.eventType(context), Icons.edit, context),
              ),
              const Padding(padding: EdgeInsets.symmetric(horizontal: 2.0)),
              Expanded(
                child: _subtitle(lecture.sws, Icons.access_time, context),
              ),
            ],
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          if (lecture.speaker != null)
            _subtitle(lecture.speaker!, Icons.person, context),
        ],
      ),
      onTap: () {
        if (MediaQuery.orientationOf(context) == Orientation.portrait ||
            isSearch) {
          context.push(lectureDetails, extra: lecture);
        } else {
          ref.read(lectureSplitViewModel).selectedWidget.add(
                LectureDetailsView(
                  key: Key(lecture.title),
                  lecture: lecture,
                ),
              );
        }
      },
    );
  }

  Widget _subtitle(String text, IconData iconData, BuildContext context) {
    return IconText(
      iconData: iconData,
      label: text,
      style: TextStyle(color: Theme.of(context).colorScheme.secondary),
      iconColor: Theme.of(context).primaryColor,
      multipleLines: false,
    );
  }
}
