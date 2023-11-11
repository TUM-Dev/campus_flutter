import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';

class FeedbackCheckMarkView extends ConsumerWidget {
  const FeedbackCheckMarkView({
    super.key,
    required this.text,
    required this.isChecked,
  });

  final String text;
  final BehaviorSubject<bool> isChecked;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StreamBuilder(
      stream: isChecked,
      builder: (context, snapshot) {
        return ListTile(
          dense: true,
          title: Text(text),
          trailing: Checkbox(
            value: snapshot.data ?? false,
            onChanged: (newValue) => isChecked.add(newValue ?? false),
          ),
        );
      },
    );
  }
}
