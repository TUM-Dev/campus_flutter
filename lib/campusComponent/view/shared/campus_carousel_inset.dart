import 'package:campus_flutter/base/extensions/context.dart';
import 'package:flutter/material.dart';

/// CarouselView pads each item by 4 pixels. Supply the rest of the section
/// gutter outside the carousel so card gaps remain 8 pixels.
class CampusCarouselInset extends StatelessWidget {
  const CampusCarouselInset({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) => Padding(
    padding: EdgeInsets.symmetric(horizontal: context.padding - 4),
    child: child,
  );
}
