import 'package:flutter/material.dart';

class CustomGradient extends CustomPainter {
  CustomGradient({required this.gradient, required this.sWidth});

  final Gradient gradient;
  final double sWidth;
  final Paint p = Paint();

  @override
  void paint(Canvas canvas, Size size) {
    Rect innerRect = Rect.fromLTRB(
        sWidth, sWidth, size.width - sWidth, size.height - sWidth);
    Rect outerRect = Offset.zero & size;

    p.shader = gradient.createShader(outerRect);
    Path borderPath = _calculateBorderPath(outerRect, innerRect);
    canvas.drawPath(borderPath, p);
  }

  Path _calculateBorderPath(Rect outerRect, Rect innerRect) {
    Path outerRectPath = Path()..addRect(outerRect);
    Path innerRectPath = Path()..addRect(innerRect);
    return Path.combine(PathOperation.difference, outerRectPath, innerRectPath);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
