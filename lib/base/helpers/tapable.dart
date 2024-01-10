import 'package:flutter/material.dart';

class Tapable extends StatelessWidget {
  const Tapable({super.key, required this.child, required this.action});

  final Widget child;
  final void Function() action;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: action,
      child: child,
    );
  }
}
