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
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Scaffold(
                appBar: AppBar(leading: const BackButton()),
                body: LectureDetailsView(
                  lecture: lecture,
                ),
              ),
            ),
          );
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
