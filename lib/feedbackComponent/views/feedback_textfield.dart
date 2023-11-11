import 'package:campus_flutter/base/helpers/card_with_padding.dart';
import 'package:campus_flutter/homeComponent/widgetComponent/views/widget_frame_view.dart';
import 'package:flutter/material.dart';

class FeedbackTextField extends StatelessWidget {
  const FeedbackTextField({
    super.key,
    required this.title,
    required this.textEditingController,
    this.expanded = false,
  });

  final String title;
  final TextEditingController textEditingController;
  final bool expanded;

  @override
  Widget build(BuildContext context) {
    return WidgetFrameView(
      title: title,
      child: CardWithPadding(
        child: TextFormField(
          controller: textEditingController,
          minLines: expanded ? 3 : null,
          maxLines: expanded ? 6 : null,
        ),
      ),
    );
  }
}
