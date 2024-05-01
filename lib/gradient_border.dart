import 'package:flutter/material.dart';

class GradientBorder extends StatelessWidget {
  const GradientBorder(
      {required this.child,
      this.gradient,
      this.padding,
      this.radius,
      super.key});

  final Widget child;
  final Gradient? gradient;
  final double? padding;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding ?? 2),
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Colors.blue.shade200,
              Colors.purple.shade200,
            ]),
        borderRadius: BorderRadius.circular(radius ?? 24),
      ),
      child: child,
    );
  }
}
