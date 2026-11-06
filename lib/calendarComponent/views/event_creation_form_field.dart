import 'package:campus_flutter/base/extensions/context.dart';
import 'package:campus_flutter/calendarComponent/model/calendar_event.dart';
import 'package:campus_flutter/calendarComponent/viewModels/calendar_addition_viewmodel.dart';
import 'package:flutter/material.dart';
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
      padding: EdgeInsets.symmetric(horizontal: context.padding),
      child: TextFormField(
        controller: controller,
        maxLength: maxLength,
        minLines: 1,
        maxLines: maxLines,
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
