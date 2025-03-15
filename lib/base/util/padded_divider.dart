import 'package:campus_flutter/base/extensions/context.dart';
import 'package:flutter/material.dart';

class PaddedDivider extends StatelessWidget {
  const PaddedDivider({super.key, this.height});

  final double? height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.padding),
      child: Divider(height: height),
    );
  }
}
