import 'package:flutter/material.dart';

import 'package:campus_flutter/base/util/diagonalStripePattern/stripe_pattern_painter.dart';

/// source: https://github.com/LuuNgocLan/flutter-snippets/blob/main/flutter_stripe_canvas/lib/diagonal_stripe/diagonal_stripe_pattern_view.dart
class DiagonalStripePatternView extends StatelessWidget {
  final double? stripeWidth;
  final double? gapWidth;
  final double? rotateDegree;
  final Color? stripeColor;
  final Color? bgColor;

  const DiagonalStripePatternView({
    super.key,
    this.stripeColor,
    this.stripeWidth,
    this.gapWidth,
    this.rotateDegree,
    this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        /// Cut the excess border around the frame by using ClipRRect
        return ClipRRect(
          child: CustomPaint(
            /// The screen size we grabbed a few lines earlie
            /// default: Size.zero
            size: Size(constraints.maxWidth, constraints.maxHeight),

            /// use foregroundPainter as overlay mark
            foregroundPainter: StripePatternPainter(
              stripeColor:
                  stripeColor ??
                  const Color(0xFF222222).withValues(alpha: 0.08),
              bgColor: bgColor,
            ),
          ),
        );
      },
    );
  }
}
