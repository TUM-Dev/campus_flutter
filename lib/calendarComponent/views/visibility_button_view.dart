import 'package:campus_flutter/calendarComponent/viewModels/calendar_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VisibilityButtonView extends ConsumerStatefulWidget {
  const VisibilityButtonView({
    super.key,
    required this.id,
    required this.isVisible,
  });

  final String id;
  final bool? isVisible;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _VisibilityButtonViewState();
}

class _VisibilityButtonViewState extends ConsumerState<VisibilityButtonView> {
  late bool isVisible = widget.isVisible ?? true;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ref.read(calendarViewModel).toggleEventVisibility(
              widget.id,
            );
        setState(() {
          isVisible = !isVisible;
        });
      },
      child: Icon(
        (isVisible) ? Icons.visibility : Icons.visibility_off,
      ),
    );
  }
}
