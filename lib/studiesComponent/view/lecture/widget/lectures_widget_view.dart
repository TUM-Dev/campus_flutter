import 'package:campus_flutter/studiesComponent/viewModel/lecture_viewmodel.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LecturesWidgetView extends ConsumerStatefulWidget {
  const LecturesWidgetView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _LecturesWidgetViewState();
}

class _LecturesWidgetViewState extends ConsumerState<LecturesWidgetView> {
  @override
  void initState() {
    ref.read(lectureViewModel).fetch(false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        context.tr("lectures"),
      ),
    );
  }
}
