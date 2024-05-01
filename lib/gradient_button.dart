import 'package:flutter/material.dart';
import 'package:flutter_todo/register.dart';

class GradientButton extends StatelessWidget {
  const GradientButton({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context,
          MaterialPageRoute(builder: (context) => const RegisterPage())),
      child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Colors.blue.shade200,
                Colors.purple.shade200,
              ],
            ),
          ),
          child: child),
    );
  }
}
