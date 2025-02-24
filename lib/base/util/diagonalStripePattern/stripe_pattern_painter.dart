import 'dart:math';

import 'package:flutter/material.dart';

/// source: https://github.com/LuuNgocLan/flutter-snippets/blob/main/flutter_stripe_canvas/lib/diagonal_stripe/stripe_pattern_painter.dart
class StripePatternPainter extends CustomPainter {
  final double stripeWidth;
  final double gapWidth;
  final double rotateDegree;
  final Color stripeColor;
  final Color bgColor;

  StripePatternPainter({
    this.stripeWidth = 5.0,
    this.gapWidth = 5.0,
    this.rotateDegree = 45.0,
    this.stripeColor = Colors.grey,
    Color? bgColor,
  }) : bgColor = bgColor ?? Colors.transparent;

  @override
  void paint(Canvas canvas, Size size) {
    /// Expand canvas size
    const offsetX = 0.0;
    const offsetY = 0.0;
    final width = size.width + offsetX * 2;
    final height = size.height + offsetY * 2;

    /// Shift canvas to top,left with offsetX,Y
    canvas.translate(-offsetX, -offsetY);

    /// Calculate the biggest diagonal of the screen.
    final double diagonal = sqrt(width * width + height * height);

    /// jointSize: distance from right edge of (i) stripe to right one of next stripe
    final double jointSize = stripeWidth + gapWidth;

    /// Calculate the number of iterations needed to cover the diagonal of the screen.
    final int numIterations = (diagonal / jointSize).ceil();

    /// convert degree to radian
    final rotateRadian = pi / 180 * rotateDegree;

    /// calculate the xOffset, yOffset according to the trigonometric formula
    final xOffset = jointSize / sin(rotateRadian);
    final yOffset = jointSize / sin(pi / 2 - rotateRadian);

    /// config stroke paint object
    final paint =
        Paint()
          ..color = stripeColor
          ..style = PaintingStyle.stroke
          ..strokeWidth = stripeWidth;
    final path = Path();

    /// setup the path
    for (int i = 0; i < numIterations; i++) {
      /// start point on Y axis -> xStart = 0
      final double yStart = i * yOffset;

      /// end point on X axis -> yEnd = 0
      final double xEnd = i * xOffset;

      /// make line start -> end
      path.moveTo(0, yStart);
      path.lineTo(xEnd, 0);
    }

    /// draw path on canvas by using paint object
    canvas.drawPath(path, paint);

    /// Fill the pattern area background with the patternColor.
    final patternPaint =
        Paint()
          ..color = bgColor
          ..style = PaintingStyle.fill;
    canvas.drawRect(Offset.zero & size, patternPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
