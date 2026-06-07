import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class RefreshButton extends StatelessWidget {
  const RefreshButton({
    super.key,
    required this.isLoading,
    required this.onRefresh,
    this.padding,
  });

  final BehaviorSubject<bool> isLoading;
  final VoidCallback onRefresh;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: isLoading,
      builder: (context, snapshot) {
        final loading = snapshot.data ?? false;
        return IconButton(
          padding: padding,
          onPressed: loading ? null : onRefresh,
          icon: loading
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Icon(Icons.refresh),
        );
      },
    );
  }
}
