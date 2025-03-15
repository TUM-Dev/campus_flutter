import 'package:campus_flutter/base/routing/routes.dart';
import 'package:campus_flutter/studiesComponent/view/grade/widget/grades_widget_view.dart';
import 'package:campus_flutter/studiesComponent/view/lecture/widget/lectures_widget_view.dart';
import 'package:campus_flutter/studiesComponent/view/studies_card_view.dart';
import 'package:campus_flutter/studiesComponent/view/theses/widget/theses_widget_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class StudiesScreen extends StatefulWidget {
  const StudiesScreen({super.key});

  @override
  State<StatefulWidget> createState() => _StudiesScreenState();
}

class _StudiesScreenState extends State<StudiesScreen> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: [
            StudiesCardView(
              title: context.tr("grades"),
              body: GradesWidgetView(),
              height: constraints.maxHeight / 3,
              onTap: () {
                context.push(grades);
              },
            ),
            StudiesCardView(
              title: context.tr("lectures"),
              body: LecturesWidgetView(),
              height: constraints.maxHeight / 3,
              onTap: () {
                context.push(lectures);
              },
            ),
            StudiesCardView(
              title: context.tr("theses"),
              body: ThesesWidgetView(),
              height: constraints.maxHeight / 3,
              onTap: () {
                context.push(theses);
              },
            ),
          ],
        );
      },
    );
  }
}
