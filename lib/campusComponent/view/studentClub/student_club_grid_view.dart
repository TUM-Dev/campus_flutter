import 'package:campus_flutter/base/extensions/context.dart';
import 'package:campus_flutter/base/networking/apis/tumdev/campus_backend.pb.dart';
import 'package:campus_flutter/campusComponent/view/studentClub/student_club_card_view.dart';
import 'package:flutter/material.dart';

class StudentClubGridView extends StatelessWidget {
  const StudentClubGridView({
    super.key,
    required this.studentClubs,
    required this.padding,
    required this.crossAxisCount,
    required this.withinScrollView,
  });

  final List<StudentClub> studentClubs;
  final EdgeInsets padding;
  final int crossAxisCount;
  final bool withinScrollView;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: withinScrollView,
      physics: withinScrollView ? NeverScrollableScrollPhysics() : null,
      padding: padding,
      mainAxisSpacing: context.padding,
      crossAxisSpacing: context.padding,
      crossAxisCount: crossAxisCount,
      children: [
        for (var studentClub in studentClubs)
          StudentClubCardView(studentClub: studentClub),
      ],
    );
  }
}
