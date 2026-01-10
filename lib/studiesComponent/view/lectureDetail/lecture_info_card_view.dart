import 'package:campus_flutter/base/util/icon_text.dart';
import 'package:campus_flutter/base/util/seperated_list.dart';
import 'package:campus_flutter/homeComponent/view/widget/widget_frame_view.dart';
import 'package:flutter/material.dart';

class LectureInfoCardView extends StatelessWidget {
  const LectureInfoCardView({
    super.key,
    required this.icon,
    required this.title,
    required this.widgets,
  });

  final IconData icon;
  final String title;
  final List<Widget> widgets;

  @override
  Widget build(BuildContext context) {
    return WidgetFrameView(
      titleWidget: SymbolText.icon(
        iconData: icon,
        label: title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      child: Card(
        child: SeparatedList.widgets(
          widgets: widgets,
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
      ),
    );
  }
}
