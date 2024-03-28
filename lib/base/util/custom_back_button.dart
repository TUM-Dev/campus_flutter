import 'package:campus_flutter/base/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
    this.onPressed,
    this.color,
  });

  final Function()? onPressed;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return BackButton(
      color: color,
      onPressed: onPressed ?? () => defaultOnPressed(context),
    );
  }

  void defaultOnPressed(BuildContext context) {
    context.canPop() ? context.pop() : context.go(home);
  }
}
