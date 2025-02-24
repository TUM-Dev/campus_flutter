import 'package:campus_flutter/base/extensions/context.dart';
import 'package:flutter/material.dart';

class HorizontalSlider<E> extends StatelessWidget {
  factory HorizontalSlider.height({
    required List<E> data,
    required Widget Function(E data) child,
    required double height,
    bool leadingTrailingPadding = true,
    bool scrollBar = false,
  }) {
    return HorizontalSlider._(
      data: data,
      child: child,
      height: height,
      leadingTrailingPadding: leadingTrailingPadding,
      scrollBar: scrollBar,
    );
  }

  factory HorizontalSlider.aspectRatio({
    required List<E> data,
    required Widget Function(E data) child,
    required double aspectRatio,
    bool leadingTrailingPadding = true,
    bool scrollBar = false,
  }) {
    return HorizontalSlider._(
      data: data,
      child: child,
      aspectRatio: aspectRatio,
      leadingTrailingPadding: leadingTrailingPadding,
      scrollBar: scrollBar,
    );
  }

  const HorizontalSlider._({
    super.key,
    required this.data,
    this.height,
    this.aspectRatio,
    required this.child,
    required this.leadingTrailingPadding,
    required this.scrollBar,
  });

  final List<E> data;
  final Widget Function(E data) child;
  final double? height;
  final double? aspectRatio;
  final bool leadingTrailingPadding;
  final bool scrollBar;

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.orientationOf(context);
    if (aspectRatio != null) {
      return AspectRatio(
        aspectRatio: aspectRatio!,
        child: _body(orientation, context),
      );
    } else {
      return SizedBox(height: height!, child: _body(orientation, context));
    }
  }

  Widget _body(Orientation orientation, BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: orientation == Orientation.landscape ? context.padding : 0,
      ),
      child:
          scrollBar
              ? Scrollbar(child: _content(orientation, context))
              : _content(orientation, context),
    );
  }

  Widget _content(Orientation orientation, BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(bottom: context.halfPadding),
      scrollDirection: Axis.horizontal,
      children: [
        for (var indexAndValue in data.indexed) ...[
          if (indexAndValue.$1 == 0) ...[
            if (leadingTrailingPadding)
              const Padding(padding: EdgeInsets.symmetric(horizontal: 7.5)),
            child(indexAndValue.$2),
          ],
          if (indexAndValue.$1 != 0 && indexAndValue.$1 == data.length - 1) ...[
            const Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
            child(indexAndValue.$2),
            if (orientation != Orientation.landscape && leadingTrailingPadding)
              const Padding(padding: EdgeInsets.symmetric(horizontal: 7.5)),
          ],
          if (indexAndValue.$1 != 0 && indexAndValue.$1 != data.length - 1) ...[
            const Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
            child(indexAndValue.$2),
          ],
        ],
      ],
    );
  }
}
