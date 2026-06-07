import 'dart:async';

import 'package:flutter/material.dart';

class RefreshButton extends StatefulWidget {
  const RefreshButton({
    super.key,
    required this.isLoading,
    required this.onRefresh,
    this.padding,
  });

  final Stream<bool> isLoading;
  final VoidCallback onRefresh;
  final EdgeInsetsGeometry? padding;

  @override
  State<RefreshButton> createState() => _RefreshButtonState();
}

class _RefreshButtonState extends State<RefreshButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 800),
  );

  late final StreamSubscription<bool> _sub;
  bool _spinning = false;

  @override
  void initState() {
    super.initState();
    _sub = widget.isLoading.listen((loading) {
      setState(() => _spinning = loading);
      if (loading) {
        _controller.repeat();
      } else {
        _controller.stop();
        _controller.reset();
      }
    });
  }

  @override
  void dispose() {
    _sub.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: widget.padding,
      icon: RotationTransition(
        turns: _controller,
        child: const Icon(Icons.refresh),
      ),
      onPressed: _spinning ? null : widget.onRefresh,
    );
  }
}
