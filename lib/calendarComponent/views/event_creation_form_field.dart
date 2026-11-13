import 'package:campus_flutter/base/extensions/context.dart';
import 'package:campus_flutter/calendarComponent/model/calendar_event.dart';
import 'package:campus_flutter/calendarComponent/viewModels/calendar_addition_viewmodel.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EventCreationFormField extends ConsumerWidget {
  const EventCreationFormField({
    super.key,
    required this.title,
    required this.controller,
    required this.maxLength,
    required this.maxLines,
    required this.calendarEvent,
  });

  final String title;
  final TextEditingController controller;
  final int maxLength;
  final int maxLines;
  final CalendarEvent? calendarEvent;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.padding,
        vertical: context.halfPadding,
      ),
      child: TextFormField(
        controller: controller,
        maxLength: maxLength,
        minLines: 1,
        maxLines: maxLines,
        style: Theme.of(context).textTheme.bodyMedium,
        textCapitalization: TextCapitalization.sentences,
        textInputAction: maxLines == 1
            ? TextInputAction.next
            : TextInputAction.newline,
        decoration: InputDecoration(
          labelText: title,
          border: InputBorder.none,
          counterText: "",
        ),
        onChanged: (value) =>
            ref.read(calendarAdditionViewModel(calendarEvent)).checkValidity(),
        onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
      ),
    );
  }
}
