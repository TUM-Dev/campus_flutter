import 'package:flutter/material.dart';

class HorizontalSlider<E> extends StatelessWidget {
  const HorizontalSlider(
      {super.key, required this.data, required this.height, required this.child});

  final List<E> data;
  final Widget Function(E data) child;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height,
        child: ListView(scrollDirection: Axis.horizontal, children: [
          for (var indexAndValue in data.indexed) ...[
            if (indexAndValue.$1 == 0) ...[
              const Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
              child(indexAndValue.$2)
            ],
            if (indexAndValue.$1 == data.length - 1) ...[
              const Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
              child(indexAndValue.$2),
              const Padding(padding: EdgeInsets.symmetric(horizontal: 5))
            ],
            if (indexAndValue.$1 != 0 && indexAndValue.$1 != data.length - 1) ...[
              const Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
              child(indexAndValue.$2)
            ]
          ]
        ]));
  }
}
