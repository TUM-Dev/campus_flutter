import 'package:campus_flutter/base/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BackButton(
      onPressed: () => context.canPop() ? context.pop() : context.go(home),
    );
  }
}
