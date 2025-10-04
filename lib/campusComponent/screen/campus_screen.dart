import 'package:campus_flutter/campusComponent/view/studentClub/student_club_widget_view.dart';
import 'package:campus_flutter/campusComponent/view/movie/movies_widget_view.dart';
import 'package:campus_flutter/campusComponent/view/news/news_widget_view.dart';
import 'package:flutter/material.dart';

class CampusScreen extends StatelessWidget {
  const CampusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        if (orientation == Orientation.portrait) {
          return body();
        } else {
          return SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Row(children: [
                Expanded(child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(children: [
                   Text('News', style: Theme.of(context).textTheme.headlineSmall),
                    const SizedBox(height: 10),
                    NewsWidgetView(),
                  ],),)),

                const VerticalDivider(width: 0),
                Expanded(child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(children: [
                    StudentClubWidgetView(),
                    const SizedBox(height: 10),
                    MovieWidgetView(),
                  ],),)), ]
              ));
        }
      },
    );
  }

  Widget body() {
    return const Scrollbar(
      child: SingleChildScrollView(
        child: Column(
          children: [
            NewsWidgetView(),
            StudentClubWidgetView(),
            MovieWidgetView(),
          ],
        ),
      ),
    );
  }
}
