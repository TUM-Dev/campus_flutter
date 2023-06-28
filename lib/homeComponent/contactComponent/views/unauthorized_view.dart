import 'package:flutter/material.dart';

class UnauthorizedView extends StatelessWidget {
  const UnauthorizedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage(
                  'assets/images/placeholders/portrait_placeholder.png'),
              radius: 50,
            ),
            const Spacer(),
            Text("Not Logged In", style: Theme.of(context).textTheme.titleLarge),
            const Spacer(flex: 2)
          ],
        ));
  }
}