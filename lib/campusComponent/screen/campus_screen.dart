import 'package:campus_flutter/campusComponent/view/studentClub/student_club_widget_view.dart';
import 'package:campus_flutter/campusComponent/view/movie/movies_widget_view.dart';
import 'package:campus_flutter/campusComponent/view/news/news_widget_view.dart';
import 'package:flutter/material.dart';

class CampusScreen extends StatelessWidget {
  const CampusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          NewsWidgetView(),
          StudentClubWidgetView(),
          MovieWidgetView(),
        ],
      ),
    );
  }
}
