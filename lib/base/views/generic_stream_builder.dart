import 'package:flutter/material.dart';

class GenericStreamBuilder<T> extends StatelessWidget {
  const GenericStreamBuilder({
    super.key,
    required this.stream,
    required this.dataBuilder,
    required this.errorBuilder,
    required this.loadingBuilder,
  });

  final Stream<T?> stream;
  final Widget Function(BuildContext, T) dataBuilder;
  final Widget Function(BuildContext, dynamic) errorBuilder;
  final Widget Function(BuildContext) loadingBuilder;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<T?>(
      stream: stream,
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data != null) {
          return dataBuilder(context, snapshot.data as T);
        } else if (snapshot.hasError) {
          return errorBuilder(context, snapshot.error);
        } else {
          return loadingBuilder(context);
        }
      },
    );
  }
}