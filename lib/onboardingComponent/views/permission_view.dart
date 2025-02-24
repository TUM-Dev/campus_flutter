import 'package:campus_flutter/base/extensions/context.dart';
import 'package:flutter/material.dart';

class PermissionView extends StatelessWidget {
  const PermissionView({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.onButtonPress,
  });

  final String imagePath;
  final String title;
  final String description;
  final VoidCallback onButtonPress;

  @override
  Widget build(BuildContext context) {
    final backgroundColor =
        Theme.of(context).brightness == Brightness.dark
            ? Theme.of(context).canvasColor
            : Colors.white;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(flex: 2),
            Image.asset(imagePath, height: 150),
            const Spacer(),
            Text(
              title,
              style: Theme.of(
                context,
              ).textTheme.headlineMedium?.apply(color: context.primaryColor),
            ),
            Padding(
              padding: EdgeInsets.all(context.padding),
              child: Text(description, textAlign: TextAlign.center),
            ),
            const Spacer(),
            ElevatedButton(onPressed: onButtonPress, child: const Text("Okay")),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
