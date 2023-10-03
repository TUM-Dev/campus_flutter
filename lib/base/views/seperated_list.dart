import 'package:campus_flutter/base/helpers/padded_divider.dart';
import 'package:flutter/material.dart';

class SeparatedList<T> extends StatelessWidget {
  factory SeparatedList.list(
      {required List<T> data,
      required Widget Function(T) tile,
      bool padded = true}) {
    return SeparatedList._(
      data: data,
      tile: tile,
      padded: padded,
    );
  }

  factory SeparatedList.widgets(
      {required List<Widget> widgets, bool padded = true}) {
    return SeparatedList._(widgets: widgets, padded: padded, list: false);
  }

  const SeparatedList._(
      {super.key,
      this.data,
      this.widgets,
      this.tile,
      this.padded = true,
      this.list = true});

  final List<T>? data;
  final List<Widget>? widgets;
  final Widget Function(T)? tile;
  final bool padded;
  final bool list;

  @override
  Widget build(BuildContext context) {
    if (list) {
      return Column(
        children: [
          for (var dataPoint in data!.indexed) ...[
            tile!(dataPoint.$2),
            if (dataPoint.$1 < data!.length - 1)
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
    } else {
      return Column(
        children: [
          for (var dataPoint in widgets!.indexed) ...[
            widgets![dataPoint.$1],
            if (dataPoint.$1 < widgets!.length - 1)
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
}
