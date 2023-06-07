import 'package:flutter/material.dart';

class DelayedLoadingIndicator extends StatelessWidget {
  const DelayedLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Future.delayed(const Duration(milliseconds: 150)),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // TODO: add loading message
            return const Center(child: CircularProgressIndicator());
          } else {
            return const SizedBox.shrink();
          }
        }
    );
  }
}