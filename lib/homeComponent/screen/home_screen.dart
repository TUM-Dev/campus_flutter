import 'package:campus_flutter/base/util/padded_divider.dart';
import 'package:campus_flutter/homeComponent/view/contactCard/contact_view.dart';
import 'package:campus_flutter/homeComponent/view/widget/widget_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return OrientationBuilder(
      builder: (context, orientation) {
        if (orientation == Orientation.portrait) {
          return _widgetScrollView();
        } else {
          return Row(
            children: [
              const Spacer(),
              Expanded(flex: 2, child: _widgetScrollView()),
              const Spacer(),
            ],
          );
        }
      },
    );
  }

  Widget _widgetScrollView() {
    return SingleChildScrollView(
      controller: scrollController,
      child: const Column(
        children: [ContactScreen(), PaddedDivider(), WidgetScreen()],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
