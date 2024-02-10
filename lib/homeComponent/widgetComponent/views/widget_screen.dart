import 'package:campus_flutter/base/enums/error_handling_view_type.dart';
import 'package:campus_flutter/base/enums/home_widget.dart';
import 'package:campus_flutter/base/helpers/delayed_loading_indicator.dart';
import 'package:campus_flutter/base/errorHandling/error_handling_router.dart';
import 'package:campus_flutter/homeComponent/widgetComponent/viewModels/home_viewmodel.dart';
import 'package:campus_flutter/homeComponent/widgetComponent/views/home_settings_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WidgetScreen extends ConsumerWidget {
  const WidgetScreen({super.key});

  static void showHomeSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.55,
        child: const HomeSettingsView(),
      ),
      showDragHandle: true,
      isScrollControlled: true,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StreamBuilder(
      stream: ref.watch(homeViewModel).widgets,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: [
              for (var widget in snapshot.data ?? <HomeWidget>[])
                if (widget.enabled) HomeViewModel.getWidget(widget.widgetType),
            ],
          );
        } else if (snapshot.hasError) {
          return SizedBox(
            height: MediaQuery.sizeOf(context).height * 2 / 5,
            child: ErrorHandlingRouter(
              error: snapshot.error ?? Error(),
              errorHandlingViewType: ErrorHandlingViewType.textOnly,
            ),
          );
        } else {
          return SizedBox(
            height: MediaQuery.sizeOf(context).height * 2 / 5,
            child: const DelayedLoadingIndicator(
              name: "Widgets",
            ),
          );
        }
      },
    );
  }
}
