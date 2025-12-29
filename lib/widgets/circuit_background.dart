import 'package:flutter/material.dart';

enum CircuitTheme {
  gold,
}

class CircuitBackground extends StatelessWidget {
  final CircuitTheme theme;

  const CircuitBackground({
    super.key,
    this.theme = CircuitTheme.gold,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: theme == CircuitTheme.gold
              ? [
                  Colors.amber.withOpacity(0.15),
                  Colors.black,
                ]
              : [
                  Colors.blueGrey,
                  Colors.black,
                ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
    );
  }
}
