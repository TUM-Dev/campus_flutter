import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThesesWidgetView extends ConsumerStatefulWidget {
  const ThesesWidgetView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ThesesWidgetViewState();
}

class _ThesesWidgetViewState extends ConsumerState<ThesesWidgetView> {
  @override
  void initState() {
    // TODO: fetch available theses offers
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        context.tr("theses"),
      ),
    );
  }
}
