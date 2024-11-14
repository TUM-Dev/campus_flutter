import 'package:campus_flutter/base/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
    this.beforeOnPressed,
    this.onPressed,
    this.color,
  });

  final Function()? onPressed;
  final Function()? beforeOnPressed;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return BackButton(
      color: color,
      onPressed: () {
        if (beforeOnPressed != null) {
          beforeOnPressed!();
        }

        if (onPressed != null) {
          onPressed!();
        } else {
          defaultOnPressed(context);
        }
      },
    );
  }

  void defaultOnPressed(BuildContext context) {
    context.canPop() ? context.pop() : context.go(home);
  }
}
