import 'package:flutter/material.dart';

class CircuitBackground extends StatelessWidget {
  final ThemeMode theme;
  
  const CircuitBackground({super.key, required this.theme});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _CircuitPainter(theme: theme),
      size: Size.infinite,
    );
  }
}

class _CircuitPainter extends CustomPainter {
  final ThemeMode theme;
  
  _CircuitPainter({required this.theme});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = _getColor().withOpacity(0.1)
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke;

    // Draw grid lines
    for (double i = 0; i < size.width; i += 40) {
      canvas.drawLine(Offset(i, 0), Offset(i, size.height), paint);
    }
    for (double i = 0; i < size.height; i += 40) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i), paint);
    }

    // Draw circuit nodes
    final nodePaint = Paint()
      ..color = _getColor().withOpacity(0.3)
      ..style = PaintingStyle.fill;

    for (double x = 20; x < size.width; x += 40) {
      for (double y = 20; y < size.height; y += 40) {
        canvas.drawCircle(Offset(x, y), 2, nodePaint);
      }
    }

    // Draw diagonal circuit paths
    final pathPaint = Paint()
      ..color = _getColor().withOpacity(0.2)
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    final path = Path()
      ..moveTo(-50, size.height * 0.3)
      ..quadraticBezierTo(
        size.width * 0.3,
        size.height * 0.2,
        size.width * 0.6,
        size.height * 0.5,
      )
      ..quadraticBezierTo(
        size.width * 0.8,
        size.height * 0.8,
        size.width + 50,
        size.height * 0.6,
      );

    canvas.drawPath(path, pathPaint);
  }

  Color _getColor() {
    switch (theme) {
      case ThemeMode.gold:
        return const Color(0xFFF7931A);
      case ThemeMode.dark:
        return const Color(0xFF00f3ff);
      case ThemeMode.light:
        return const Color(0xFF3b82f6);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

enum ThemeMode { gold, dark, light }