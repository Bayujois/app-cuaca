import 'package:flutter/material.dart';

class GradientContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;

  const GradientContainer({
    super.key,
    required this.child,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF1E88E5),
            Color(0xFF42A5F5),
          ],
        ),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: padding,
          child: child,
        ),
      ),
    );
  }
}
