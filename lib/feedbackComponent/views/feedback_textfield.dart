import 'package:campus_flutter/base/util/card_with_padding.dart';
import 'package:campus_flutter/homeComponent/widgetComponent/views/widget_frame_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FeedbackTextField extends ConsumerWidget {
  const FeedbackTextField({
    super.key,
    required this.title,
    required this.textEditingController,
    required this.validInput,
    required this.onChanged,
    required this.invalidMessage,
    required this.decorationMessage,
    this.expanded = false,
  });

  final String title;
  final TextEditingController textEditingController;
  final Stream<bool?> validInput;
  final void Function(String)? onChanged;
  final String invalidMessage;
  final String decorationMessage;
  final bool expanded;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StreamBuilder(
      stream: validInput,
      builder: (context, snapshot) {
        return WidgetFrameView(
          title: title,
          child: CardWithPadding(
            child: TextFormField(
              controller: textEditingController,
              minLines: expanded ? 4 : null,
              maxLines: expanded ? 8 : null,
              onChanged: onChanged,
              decoration: InputDecoration(
                hintText: decorationMessage,
                errorText: (snapshot.data ?? true) ? null : invalidMessage,
              ),
              onTapOutside: (_) =>
                  FocusManager.instance.primaryFocus?.unfocus(),
            ),
          ),
        );
      },
    );
  }
}
