import 'package:campus_flutter/base/helpers/padded_divider.dart';
import 'package:flutter/material.dart';

class SeparatedList<T> extends StatelessWidget {
  const SeparatedList(
      {super.key, required this.data, required this.tile, this.padded = false});

  final List<T> data;
  final Widget Function(T) tile;
  final bool padded;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var dataPoint in data.indexed) ...[
          tile(dataPoint.$2),
          if (dataPoint.$1 < data.length - 1)
            padded
                ? const PaddedDivider(
                    height: 0,
                  )
                : const Divider(
                    height: 0,
                  )
        ]
      ],
    );
  }
}
