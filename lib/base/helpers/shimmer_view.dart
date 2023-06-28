import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerView extends StatelessWidget {

  final Widget child;

  const ShimmerView({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: MediaQuery.of(context).platformBrightness == Brightness.light
            ? Colors.grey.shade300
            : Colors.grey.shade800,
        highlightColor: MediaQuery.of(context).platformBrightness == Brightness.light
            ? Colors.grey.shade100
            : Colors.grey.shade600,
        child: child
    );
  }
}