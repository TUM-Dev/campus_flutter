import 'package:campus_flutter/theme.dart';
import 'package:flutter/material.dart';

class DelayedLoadingIndicator extends StatelessWidget {
  const DelayedLoadingIndicator({
    super.key,
    required this.name,
    this.alternativeLoadingIndicator,
    this.delayWidget = const SizedBox.shrink(),
  });

  final String name;
  final Widget? alternativeLoadingIndicator;
  final Widget delayWidget;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Future.delayed(const Duration(milliseconds: 150)),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (alternativeLoadingIndicator == null) {
              return Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    const CircularProgressIndicator.adaptive(),
                    Text(context.localizations.loading(name))
                  ]));
            } else {
              return alternativeLoadingIndicator!;
            }
          } else {
            return delayWidget;
          }
        });
  }
}
