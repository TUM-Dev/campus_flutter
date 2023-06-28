import 'package:flutter/material.dart';

class PaddedDivider extends StatelessWidget {
  const PaddedDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Divider(),
    );
  }
}