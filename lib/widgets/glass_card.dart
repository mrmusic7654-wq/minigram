// lib/widgets/glass_card.dart
import 'package:flutter/material.dart';

class GlassCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final BorderRadiusGeometry? borderRadius;
  final Color? color;
  final double? blurAmount;
  
  const GlassCard({
    super.key,
    required this.child,
    this.padding,
    this.borderRadius,
    this.color,
    this.blurAmount = 10.0,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    
    return Container(
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadius.circular(16),
        color: color ?? (isDark 
          ? Colors.black.withOpacity(0.4)
          : Colors.white.withOpacity(0.7)),
        border: Border.all(
          color: isDark 
            ? Colors.white.withOpacity(0.1)
            : Colors.grey.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.circular(16),
        child: BackdropFilter(
          filter: (blurAmount ?? 10.0) > 0
            ? ColorFilter.mode(
                Colors.transparent,
                BlendMode.srcOver,
              )
            : ColorFilter.mode(
                Colors.transparent,
                BlendMode.srcOver,
              ),
          child: Padding(
            padding: padding ?? const EdgeInsets.all(16),
            child: child,
          ),
        ),
      ),
    );
  }
}