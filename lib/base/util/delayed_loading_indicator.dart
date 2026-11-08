import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class DelayedLoadingIndicator extends StatefulWidget {
  const DelayedLoadingIndicator({
    super.key,
    this.name,
    this.alternativeLoadingIndicator,
    this.delayWidget = const SizedBox.shrink(),
  });

  final String? name;
  final Widget? alternativeLoadingIndicator;
  final Widget delayWidget;

  @override
  State<DelayedLoadingIndicator> createState() =>
      _DelayedLoadingIndicatorState();
}

class _DelayedLoadingIndicatorState extends State<DelayedLoadingIndicator> {
  late final Timer _timer;
  bool _showLoading = false;

  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(milliseconds: 150), () {
      setState(() => _showLoading = true);
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_showLoading) return widget.delayWidget;
    return widget.alternativeLoadingIndicator ??
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircularProgressIndicator.adaptive(),
              Text(
                widget.name != null
                    ? context.tr("loadingName", args: [widget.name!])
                    : context.tr("loading"),
              ),
            ],
          ),
        );
  }
}
