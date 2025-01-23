import 'package:campus_flutter/homeComponent/view/widget/widget_frame_view.dart';
import 'package:flutter/material.dart';

class StudiesCardView extends StatelessWidget {
  const StudiesCardView({
    super.key,
    required this.title,
    required this.body,
    required this.height,
    required this.onTap,
  });

  final String title;
  final Widget body;
  final double height;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.maxFinite,
      child: WidgetFrameView(
        title: title,
        child: Expanded(
          child: InkWell(
            onTap: onTap,
            child: Card(
              child: body,
            ),
          ),
        ),
      ),
    );
  }
}
