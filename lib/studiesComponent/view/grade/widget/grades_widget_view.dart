import 'package:campus_flutter/studiesComponent/viewModel/grade_viewmodel.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GradesWidgetView extends ConsumerStatefulWidget {
  const GradesWidgetView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _GradesWidgetViewState();
}

class _GradesWidgetViewState extends ConsumerState<GradesWidgetView> {
  @override
  void initState() {
    ref.read(gradeViewModel).fetch(false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        context.tr("grades"),
      ),
    );
  }
}
