import 'package:flutter/material.dart';

class CircuitPainter extends CustomPainter {
  final Color lineColor;
  final double lineWidth;
  final double gridSize;

  CircuitPainter({
    this.lineColor = const Color(0xFFF7931A),
    this.lineWidth = 1.0,
    this.gridSize = 40.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = lineColor.withOpacity(0.2)
      ..strokeWidth = lineWidth
      ..style = PaintingStyle.stroke;

    // Draw vertical lines
    for (double x = 0; x < size.width; x += gridSize) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }

    // Draw horizontal lines
    for (double y = 0; y < size.height; y += gridSize) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }

    // Draw circuit nodes
    final nodePaint = Paint()
      ..color = lineColor.withOpacity(0.4)
      ..style = PaintingStyle.fill;

    for (double x = gridSize / 2; x < size.width; x += gridSize) {
      for (double y = gridSize / 2; y < size.height; y += gridSize) {
        canvas.drawCircle(Offset(x, y), 2.0, nodePaint);
      }
    }

    // Draw animated circuit path
    final animatedPaint = Paint()
      ..color = lineColor.withOpacity(0.3)
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final path = Path()
      ..moveTo(-50, size.height * 0.25)
      ..quadraticBezierTo(
        size.width * 0.25,
        size.height * 0.15,
        size.width * 0.5,
        size.height * 0.4,
      )
      ..quadraticBezierTo(
        size.width * 0.75,
        size.height * 0.65,
        size.width + 50,
        size.height * 0.45,
      );

    canvas.drawPath(path, animatedPaint);

    // Draw diagonal lines
    final diagonalPaint = Paint()
      ..color = lineColor.withOpacity(0.15)
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke;

    for (double i = -size.height; i < size.width + size.height; i += gridSize * 2) {
      canvas.drawLine(
        Offset(i, 0),
        Offset(i + size.height, size.height),
        diagonalPaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}