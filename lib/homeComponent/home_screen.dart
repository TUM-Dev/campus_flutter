import 'package:campus_flutter/base/helpers/padded_divider.dart';
import 'package:campus_flutter/homeComponent/contactComponent/views/contact_view.dart';
import 'package:campus_flutter/homeComponent/split_view_viewmodel.dart';
import 'package:campus_flutter/homeComponent/widgetComponent/views/widget_screen.dart';
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
          return const AnimatedSplitView();
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

class AnimatedSplitView extends ConsumerStatefulWidget {
  const AnimatedSplitView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AnimatedSplitViewState();
}

class _AnimatedSplitViewState extends ConsumerState<AnimatedSplitView>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _animation = IntTween(begin: 0, end: 600).animate(_animationController);
    _animation.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    final double value = _animation.value / 2;
    return StreamBuilder(
      stream: ref.read(homeSplitViewModel).selectedWidget,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          _animationController.forward();
        } else if (!snapshot.hasData && _animationController.value != 0.0) {
          _animationController.reverse();
        }
        return Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(flex: 300 - value.toInt(), child: Container()),
              Expanded(flex: 400, child: _widgetScrollView()),
              Expanded(flex: 300 - value.toInt(), child: Container()),
              Expanded(
                flex: _animation.value,
                child: (snapshot.hasData && _animation.value == 600)
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IconButton(
                            onPressed: () => ref
                                .read(homeSplitViewModel)
                                .selectedWidget
                                .add(null),
                            icon: const Icon(Icons.close),
                          ),
                          Expanded(child: snapshot.data!),
                        ],
                      )
                    : Container(),
              ),
            ],
          ),
        );
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
}
