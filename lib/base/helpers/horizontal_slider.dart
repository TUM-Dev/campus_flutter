import 'package:flutter/material.dart';

class HorizontalSlider<E> extends StatelessWidget {
  const HorizontalSlider(
      {super.key,
      required this.data,
      required this.height,
      required this.child});

  final List<E> data;
  final Widget Function(E data) child;
  final double height;

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.orientationOf(context);
    return SizedBox(
        height: height,
        child: Padding(
            padding: EdgeInsets.only(
                right: orientation == Orientation.landscape ? 10 : 0),
            child: ListView(scrollDirection: Axis.horizontal, children: [
              for (var indexAndValue in data.indexed) ...[
                if (indexAndValue.$1 == 0) ...[
                  const Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
                  child(indexAndValue.$2)
                ],
                if (indexAndValue.$1 == data.length - 1) ...[
                  const Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
                  child(indexAndValue.$2),
                  if (orientation != Orientation.landscape)
                    const Padding(padding: EdgeInsets.symmetric(horizontal: 5))
                ],
                if (indexAndValue.$1 != 0 &&
                    indexAndValue.$1 != data.length - 1) ...[
                  const Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
                  child(indexAndValue.$2)
                ]
              ]
            ])));
  }
}
