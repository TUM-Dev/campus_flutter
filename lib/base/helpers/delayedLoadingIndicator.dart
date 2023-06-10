import 'package:flutter/material.dart';

class DelayedLoadingIndicator extends StatelessWidget {
  const DelayedLoadingIndicator({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Future.delayed(const Duration(milliseconds: 150)),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircularProgressIndicator.adaptive(),
                    Text("Loading $name")
                  ]
                )
            );
          } else {
            return const SizedBox.shrink();
          }
        }
    );
  }
}