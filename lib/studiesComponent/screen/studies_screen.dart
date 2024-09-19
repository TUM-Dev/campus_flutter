import 'package:campus_flutter/base/extensions/context.dart';
import 'package:campus_flutter/studiesComponent/view/grade/grades_view.dart';
import 'package:campus_flutter/studiesComponent/view/lecture/lectures_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class StudiesScreen extends StatefulWidget {
  const StudiesScreen({super.key});

  @override
  State<StatefulWidget> createState() => _StudiesScreenState();
}

class _StudiesScreenState extends State<StudiesScreen>
    with AutomaticKeepAliveClientMixin<StudiesScreen> {
  int selectedPage = 0;
  PageController pageController = PageController();

  final List<Widget> pages = const [
    GradesView(),
    LecturesView(),
  ];

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.padding),
          child: SizedBox(
            width: double.infinity,
            child: SegmentedButton(
              showSelectedIcon: false,
              segments: [
                ButtonSegment(value: 0, label: Text(context.tr("grades"))),
                ButtonSegment(value: 1, label: Text(context.tr("lectures"))),
              ],
              selected: {
                selectedPage,
              },
              onSelectionChanged: (selection) {
                setState(() {
                  selectedPage = selection.first;
                });
                pageController.animateToPage(
                  selectedPage,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
            ),
          ),
        ),
        Expanded(
          child: PageView(
            controller: pageController,
            onPageChanged: (page) {
              setState(() {
                selectedPage = page;
              });
            },
            children: pages,
          ),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
