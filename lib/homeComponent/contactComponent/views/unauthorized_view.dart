import 'package:flutter/material.dart';
import 'package:campus_flutter/base/extensions/context.dart';

class UnauthorizedView extends StatelessWidget {
  const UnauthorizedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          backgroundImage:
              AssetImage('assets/images/placeholders/portrait_placeholder.png'),
          radius: 50,
        ),
        const Spacer(),
        Text(
          context.localizations.notLoggedIn,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const Spacer(flex: 2),
      ],
    );
  }
}
